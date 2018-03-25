-module(my_cache).
-include_lib("stdlib/include/ms_transform.hrl").
-export([create/0, all/0, create/1,  delete_obsolete/0, insert/3, lookup/1, timenow/0]).

create() ->
	ets:new(table, [public, named_table]).
create(Opt) ->
	ets:new(table, Opt).

delete_obsolete() ->
	Now = timenow(),
	Fun = ets:fun2ms(fun({Key, _Value, Time}) 
						when Now > Time -> 
							Key end),
	ets:delete(table, Fun).

insert(Key, Value, Time)  ->
	ets:insert(table, {Key, Value, (timenow()+Time)}).

lookup(Key) ->
	[{_, _, Time}] = ets:lookup(table, Key),
	Now = timenow(),
	if 
		Now > Time ->  
			ets:delete(table, Key),
			"This Key deleted";
		true -> 
			ets:lookup(table, Key)
	end.

all() ->
	Fun1 = ets:fun2ms(fun({Key, Value, Time}) 
						when Key /= 0 -> 
							[Key, Value, Time] end),
	ets:select(table, Fun1).

timenow() ->
	calendar:datetime_to_gregorian_seconds({date(), time()}).

