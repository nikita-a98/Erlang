-module(p09_test).

-include_lib("eunit/include/eunit.hrl").

pack_test() ->
	?assertEqual([[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]], p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([[a,a,a,a]], p09:pack([a,a,a,a])),
	?assertEqual([[a]], p09:pack([a])),
	?assertEqual([], p09:pack([])).