-module(p12).
-export([decode_modified/1]).

decode_modified(List) -> decode_modified(List, 1).

decode_modified([], _) -> [];
decode_modified([{Acc, H}|T],1) -> 
	decode_modified([H|T], Acc);
decode_modified([H|T],1) -> 
	[H|decode_modified(T, 1)];
decode_modified([H|T], Acc) -> 
	[H|decode_modified([H|T], Acc-1)].
