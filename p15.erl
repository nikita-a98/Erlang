-module(p15).
-export([replicate/2]).

replicate(List, Acc) -> 
	replicate(List, Acc, Acc).
replicate([_H | T], Acc, 0) -> 	
	replicate(T, Acc, Acc);
replicate([H | T], Acc, N) -> 
	[H | replicate([H | T], Acc, N-1)];
replicate([],_,_) -> [].
