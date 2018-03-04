-module(p02).
-export([buf_last/1]).

buf_last([_,_]=L) ->
	L;
buf_last([_|T]) ->
	buf_last(T).	