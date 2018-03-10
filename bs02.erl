-module(bs02).
-export([words/1]).

words(L) -> 
	words(L, << >>, [ ]).

words(<< >>, Acc, Acc1) ->
	rev([Acc|Acc1]);

words(<< " ", Rest/binary >>, Acc, Acc1) -> 
	words(Rest, << >>, [Acc|Acc1]);

words(<< X, Rest/binary >>, Acc, Acc1) ->
	words(Rest, << Acc/binary, X >>, Acc1).



rev(L) ->
	rev(L,[]).

rev([H|T],Acc) ->
	rev(T,[H|Acc]);
rev([],Acc) ->
	Acc.