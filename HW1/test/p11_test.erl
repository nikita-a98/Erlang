-module(p11_test).

-include_lib("eunit/include/eunit.hrl").

encode_modified_test() ->
	?assertEqual([{4,a},b,{2,c},{2,a},d,{4,e}], p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([{3,10}], p11:encode_modified([10,10,10])),
	?assertEqual([a,b], p11:encode_modified([a,b])),
	?assertEqual([a], p11:encode_modified([a])),
	?assertEqual([], p11:encode_modified([])).