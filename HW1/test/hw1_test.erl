-module(hw1_test).
-include_lib("eunit/include/eunit.hrl").


p01_test() -> [
    ?assertEqual(1, p01:last([1])),
	?assertEqual(3, p01:last([1,2,3])),
	?_assertException(error, function_clause, p01:last([]))
	].

p02_test() -> [	
	?assertEqual([e,f], p02:buf_last([a,b,c,d,e,f]) ),
	?assertEqual(["one","two"], p02:buf_last(["one","two"])),
	?_assertException(error, function_clause, p02:buf_last([]))
	].

p03_test() -> [	
	?assertEqual(a, p03:element_at([a], 1)),
	?assertEqual(d, p03:element_at([a,b,c,d,e], 4)),
	?assertEqual(undefined, p03:element_at([a,b,c,d,e], 7)),
	?assertEqual("c", p03:element_at(["a", "b", "c"], 3))
	].

p04_test() -> [	
	?assertEqual(0, p04:len([])),
	?assertEqual(3, p04:len([a,b,c])),
	?assertEqual(5, p04:len(["a", "b", "c", "d", "e"]) )
	].

p05_test() -> [	
	?assertEqual([], p05:reverse([]) ),
	?assertEqual(["a"], p05:reverse(["a"]) ),
	?assertEqual([c,b,a], p05:reverse([a,b,c]) ),
	?assertEqual([<<"three">>, [[[2]]], [1]], p05:reverse([[1], [[[2]]], <<"three">>]) )
	].

p06_test() -> [	
	?assertEqual(true, p06:is_palindrome([])),
	?assertEqual(true, p06:is_palindrome([1,2,3,2,1])),
	?assertEqual(true, p06:is_palindrome([a])),
	?assertEqual(false, p06:is_palindrome([a,b,c,d,e])),
	?assertEqual(false, p06:is_palindrome([a,a,a,b]))	
	].

p07_test() -> [	
	?assertEqual([a,b,c,d,e], p07:flatten([a,[],[b,[c,d],e]])),
	?assertEqual([a,b,c,d,e], p07:flatten([a,[b,[c, [[]] ],[[d,e],[]]]])),
	?assertEqual([1,2,3,4,5], p07:flatten([1,2,3,4,5])),
	?assertEqual([text], p07:flatten([[text]])),
	?assertEqual([], p07:flatten([]))
	].

p08_test() -> [	
	?assertEqual([a,b,c,a,d,e], p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([a], p08:compress([a,a,a,a,a,a])),
	?assertEqual([[a], [b]], p08:compress([[a],[a], [b]])),
	?assertEqual([], p08:compress([]))
	].

p09_test() -> [	
	?assertEqual([[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]], p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([[a,a,a,a]], p09:pack([a,a,a,a])),
	?assertEqual([[a]], p09:pack([a])),
	?assertEqual([], p09:pack([]))
	].

p10_test() -> [	
	?assertEqual([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}], p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([{3,10}], p10:encode([10,10,10])),
	?assertEqual([{1,a}], p10:encode([a])),
	?assertEqual([], p10:encode([]))
	].

p11_test() -> [	
	?assertEqual([{4,a},b,{2,c},{2,a},d,{4,e}], p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
	?assertEqual([{3,10}], p11:encode_modified([10,10,10])),
	?assertEqual([a,b], p11:encode_modified([a,b])),
	?assertEqual([a], p11:encode_modified([a])),
	?assertEqual([], p11:encode_modified([])).
	].

p12_test() -> [	
	?assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}])),
	?assertEqual([10,10,10], p12:decode_modified([{3,10}])),
	?assertEqual([a,b], p12:decode_modified([a,b])),
	?assertEqual([a], p12:decode_modified([a])),
	?assertEqual([], p12:decode_modified([]))
	].

p13_test() -> [	
	?assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}])),
	?assertEqual([10,10,10], p13:decode([{3,10}])),
	?assertEqual([a], p13:decode([{1,a}])),
	?assertEqual([], p13:decode([]))
	].

p14_test() -> [	
	?assertEqual([a,a,b,b,c,c,c,c,d,d], p14:duplicate([a,b,c,c,d])),
	?assertEqual([1,1,[2],[2],3,3], p14:duplicate([1,[2],3])),
	?assertEqual(["text","text"], p14:duplicate(["text"])),
	?assertEqual([], p14:duplicate([]))
	].

p15_test() -> [	
	?assertEqual([a,a,a,b,b,b,c,c,c], p15:replicate([a,b,c], 3)),
	?assertEqual([a,b,c], p15:replicate([a,b,c], 1)),
	?assertEqual(["text","text","text","text"], p15:replicate(["text"], 4)),
	?assertEqual([], p15:replicate([], 4)),
	?assertEqual([], p15:replicate([], 0))
    ].

-endif.