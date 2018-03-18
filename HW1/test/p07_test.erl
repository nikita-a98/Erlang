-module(p07_test).

-include_lib("eunit/include/eunit.hrl").

flatten_test() ->
	?assertEqual([a,b,c,d,e], p07:flatten([a,[],[b,[c,d],e]])),
	?assertEqual([a,b,c,d,e], p07:flatten([a,[b,[c, [[]] ],[[d,e],[]]]])),
	?assertEqual([1,2,3,4,5], p07:flatten([1,2,3,4,5])),
	?assertEqual([text], p07:flatten([[text]])),
	?assertEqual([], p07:flatten([])).