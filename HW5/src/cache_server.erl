-module(cache_server).
-include_lib("stdlib/include/ms_transform.hrl").

-export([start_link/1, funk/1, create/0, all/0, create/1,  
	delete_obsolete/0, delete_obsolete/2, insert/3, 
	lookup/1, lookup_by_date/2, timenow/0]).


start_link([{drop_interval, Interv}]) ->
	spawn(cache_server, funk, [Interv]).

funk(Interv) ->
	delete_obsolete(),
	timer:sleep(Interv),
	funk(Interv).


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
	[{_, _, Time}] = ets:lookup(?MODULE, Key),
	Now = timenow(),
	if 
		Now > Time ->  
			"This Key deleted";
		true -> 
			ets:lookup(?MODULE, Key)
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