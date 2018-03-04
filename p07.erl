-module(p07).
-export([flatten/1]).

flatten([ [H|T1] |T2 ]) ->
	flatten([H, T1|T2]);

flatten([[]|T]) ->
	flatten(T);

flatten([H1|T]) ->
	[H1|flatten(T)];

flatten([]) -> [].


