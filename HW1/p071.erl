-module(p071).
-export([flatten/1]).
-export([rev/2]).

flatten(L) ->
	rev(flatten(L,[]),[]).

flatten([[]|T],Acc) ->
	flatten(T,Acc);

flatten([[_|_]=H|T] ,Acc) ->
	flatten(T,flatten(H,Acc));

flatten([H|T],Acc) ->
	flatten(T, [H|Acc]);

flatten([], Acc) ->
	Acc.
	
rev([H|T],Ac) ->
	rev(T,[H|Ac]);
rev([],Ac) ->
	Ac.
