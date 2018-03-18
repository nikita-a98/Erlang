-module(p08_test).

-include_lib("eunit/include/eunit.hrl").

compress_test() ->
	?assertEqual([a,b,c,a,d,e], p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([a], p08:compress([a,a,a,a,a,a])),
	?assertEqual([[a], [b]], p08:compress([[a],[a], [b]])),
	?assertEqual([], p08:compress([])).