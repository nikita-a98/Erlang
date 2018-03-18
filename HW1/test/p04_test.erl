-module(p04_test).

-include_lib("eunit/include/eunit.hrl").

len_test() ->
	?assertEqual(0, p04:len([])),
	?assertEqual(3, p04:len([a,b,c])),
	?assertEqual(5, p04:len(["a", "b", "c", "d", "e"]) ).