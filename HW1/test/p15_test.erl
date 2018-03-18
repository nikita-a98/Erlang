-module(p15_test).

-include_lib("eunit/include/eunit.hrl").

replicate_test() ->
	?assertEqual([a,a,a,b,b,b,c,c,c], p15:replicate([a,b,c], 3)),
	?assertEqual([a,b,c], p15:replicate([a,b,c], 1)),
	?assertEqual(["text","text","text","text"], p15:replicate(["text"], 4)),
	?assertEqual([], p15:replicate([], 4)),
	?assertEqual([], p15:replicate([], 0)).