-module(fibonachi_test).

-include_lib("eunit/include/eunit.hrl").

fib_test_() -> [
	?_assert(fib(0) =:= 1),
	?_assert(fib(1) =:= 1),
	?_assert(fib(2) =:= 2),
	?_assert(fib(3) =:= 3),
	?_assert(fib(4) =:= 5),
	?_assert(fib(5) =:= 8),
	?_assertException(error, function_clause, fib(-1))
].

