-module(p09).
-export([pack/1]).

pack(List) -> 
	pack(List, []).

pack([], _) -> [];

pack([H, H|T], Acc) -> 
	pack([H|T], [H|Acc]);
pack([H|T], Acc) -> 
	[[H|Acc] | pack(T,[])].

