-module(p10).
-export([encode/1]).

encode(List) -> encode(List, 1).

encode([],_)-> [];
encode([H, H|T], Acc) -> 
	encode([H|T], Acc+1);
encode([H|T], Acc) -> 
	[{Acc, H} | encode(T, 1)].

