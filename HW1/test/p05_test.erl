-module(p05_test).

-include_lib("eunit/include/eunit.hrl").

reverse_test() ->
	?assertEqual([], p05:reverse([]) ),
	?assertEqual(["a"], p05:reverse(["a"]) ),
	?assertEqual([c,b,a], p05:reverse([a,b,c]) ),
	?assertEqual([<<"three">>, [[[2]]], [1]], p05:reverse([[1], [[[2]]], <<"three">>]) ).