-module(bs01_test).

-include_lib("eunit/include/eunit.hrl").

first_word_test() ->
	?assertEqual(<<"Some">>, bs01:first_word(<<"Some text">>)),
	?assertEqual(<<"a">>, bs01:first_word(<<"a b c">>)),
	?assertEqual(<<"a">>, bs01:first_word(<<"a">>)),
	?assertEqual(<<".">>, bs01:first_word(<<".  text">>)),
	?assertEqual(<< >>, bs01:first_word(<<"">>)),
	?assertEqual(<< >>, bs01:first_word(<< >>)).