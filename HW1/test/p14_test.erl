-module(p14_test).

-include_lib("eunit/include/eunit.hrl").

duplicate_test() ->
	?assertEqual([a,a,b,b,c,c,c,c,d,d], p14:duplicate([a,b,c,c,d])),
	?assertEqual([1,1,[2],[2],3,3], p14:duplicate([1,[2],3])),
	?assertEqual(["text","text"], p14:duplicate(["text"])),
	?assertEqual([], p14:duplicate([])).