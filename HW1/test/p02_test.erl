-module(p02_test).

-include_lib("eunit/include/eunit.hrl").

buf_last_test() ->	
	?assertEqual([e,f], p02:buf_last([a,b,c,d,e,f]) ),
	?assertEqual(["one","two"], p02:buf_last(["one","two"])),
	?_assertException(error, function_clause, p02:buf_last([])).