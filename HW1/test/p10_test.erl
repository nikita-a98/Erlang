-module(p10_test).

-include_lib("eunit/include/eunit.hrl").

encode_test() ->
	?assertEqual([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}], p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([{3,10}], p10:encode([10,10,10])),
	?assertEqual([{1,a}], p10:encode([a])),
	?assertEqual([], p10:encode([])).