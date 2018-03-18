-module(p13).
-export([decode/1]).

decode([]) -> [];
decode([{0, _} | T]) -> 
	decode(T);
decode([{Num, H} | T]) -> 
	[ H|decode([{Num-1, H} |T]) ].

