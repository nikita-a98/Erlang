-module(p12_test).

-include_lib("eunit/include/eunit.hrl").

decode_modified_test() ->
	?assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}])),
	?assertEqual([10,10,10], p12:decode_modified([{3,10}])),
	?assertEqual([a,b], p12:decode_modified([a,b])),
	?assertEqual([a], p12:decode_modified([a])),
	?assertEqual([], p12:decode_modified([])).