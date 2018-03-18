-module(fibonachi).
-export([fib/1]).

fib(N) ->
	fib(N,0,1).

fib(0, _, Acc1) ->
	Acc1;
fib(N, Acc, Acc1) ->
	fib(N-1, Acc1, Acc1+Acc).


