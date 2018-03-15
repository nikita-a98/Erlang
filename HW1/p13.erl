-module(p13).
-export([decode/1]).

decode([]) -> [];
decode([{0, H} | T]) -> 
	decode(T);
decode([{Num, H} | T]) -> 
	[ H|decode([{Num-1, H} |T]) ].

