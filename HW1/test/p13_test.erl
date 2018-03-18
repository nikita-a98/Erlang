-module(p13_test).

-include_lib("eunit/include/eunit.hrl").

decode_test() ->
	?assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}])),
	?assertEqual([10,10,10], p13:decode([{3,10}])),
	?assertEqual([a], p13:decode([{1,a}])),
	?assertEqual([], p13:decode([])).
