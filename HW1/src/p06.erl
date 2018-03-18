-module(p06).
-export([is_palindrome/1]).

is_palindrome(L) ->
	L =:= rev(L,[]).

rev([H|T],Acc) ->
	rev(T,[H|Acc]);
rev([],Acc) ->
	Acc.
