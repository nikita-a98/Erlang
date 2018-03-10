-module(bs01).
-export([first_word/1]).

first_word(L) -> 
	first_word(L, << >>).

first_word(<< >>, Acc) ->
	Acc;

first_word(<< " ", _Rest/binary >>, Acc) -> Acc;

first_word(<< X, Rest/binary >>, Acc) ->
	first_word(Rest, << Acc/binary, X >>).