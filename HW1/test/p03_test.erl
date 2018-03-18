-module(p03_test).

-include_lib("eunit/include/eunit.hrl").

element_at_test() ->
	?assertEqual(a, p03:element_at([a], 1)),
	?assertEqual(d, p03:element_at([a,b,c,d,e], 4)),
	?assertEqual(undefined, p03:element_at([a,b,c,d,e], 7)),
	?assertEqual("c", p03:element_at(["a", "b", "c"], 3)).