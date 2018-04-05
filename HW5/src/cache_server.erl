-module(cache_server).
-include_lib("stdlib/include/ms_transform.hrl").

-behaviour(gen_server).

%% API.
-export([start_link/1, create/0, all/0, create/1,  
	delete_obsolete/0, delete_obsolete/2, insert/3, 
	lookup/1, lookup_by_date/2, timenow/0, stop/0]).

%% gen_server.
-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).
-export([handle_info/2]).
-export([terminate/2]).
-export([code_change/3]).

%% API.
start_link([{drop_interval, State}]) ->
	gen_server:start_link(?MODULE, State, []).

stop() ->
    gen_server:cast(?MODULE, stop).

create() ->
	ets:new(?MODULE, [public, named_table]).

create(Opt) ->
	ets:new(?MODULE, Opt).


delete_obsolete() ->
	Now = timenow(),
	delete_obsolete(ets:first(?MODULE), Now).

delete_obsolete('$end_of_table',_) ->
	table_clear;

delete_obsolete(Key, Now) ->
	NextKey = ets:next(?MODULE, Key),
	[{_, _, Time}] = ets:lookup(?MODULE, Key),
	if
		Now > Time -> ets:delete(?MODULE, Key);
		true -> true
	end,
	delete_obsolete(NextKey, Now).


insert(Key, Value, Time)  ->
	ets:insert(?MODULE, {Key, Value, (timenow()+Time)}).


lookup(Key) ->
	Now = timenow(),
	case ets:lookup(?MODULE, Key) of 
		[] ->
			undefined;
		[{Key, Value, Time}] when (Now < Time) ->
			[{Key, Value, Time}];
		[{Key, _Value, Time}] when (Now >= Time) ->
			key_deleted
	end.

lookup_by_date(DateFrom, DateTo) ->
	SecFrom = calendar:datetime_to_gregorian_seconds(DateFrom),
	SecTo = calendar:datetime_to_gregorian_seconds(DateTo),

	Fun = ets:fun2ms(fun({Key, Value, Time}) 
						when (SecFrom < Time) and (Time < SecTo) -> 
							[Key, Value, Time] end),
	ets:select(?MODULE, Fun).


all() ->
	Fun1 = ets:fun2ms(fun({Key, Value, Time}) 
						when Key /= 0 -> 
							[Key, Value, Time] end),
	ets:select(?MODULE, Fun1).

timenow() ->
	calendar:datetime_to_gregorian_seconds(erlang:localtime()).


%% gen_server.
init(State) ->
	create(),
    erlang:send_after(State, self(), drop_obsolete),
	{ok, State}.

handle_call(_Request, _From, State) ->
    {reply, ignored, State}.

handle_cast(stop, State) ->
    {stop, normal, State};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(drop_obsolete, State) ->
    delete_obsolete(),
    erlang:send_after(State, self(), drop_obsolete),
    {noreply, State};
handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.
