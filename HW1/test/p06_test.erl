-module(p06_test).

-include_lib("eunit/include/eunit.hrl").

reverse_test() ->
	?assertEqual(true, p06:is_palindrome([])),
	?assertEqual(true, p06:is_palindrome([1,2,3,2,1])),
	?assertEqual(true, p06:is_palindrome([a])),
	?assertEqual(false, p06:is_palindrome([a,b,c,d,e])),
	?assertEqual(false, p06:is_palindrome([a,a,a,b])).