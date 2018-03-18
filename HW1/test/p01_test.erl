-module(p01_test).

-include_lib("eunit/include/eunit.hrl").

last_test() ->
    ?assertEqual(1, p01:last([1])),
	?assertEqual(3, p01:last([1,2,3])),
	?_assertException(error, function_clause, p01:last([])).
