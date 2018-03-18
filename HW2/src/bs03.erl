-module(bs03).
-export([split/2]).

split(BinText,Ind) ->
	BinInd = list_to_binary(Ind),
	Size = size(BinInd),
	split(BinText, BinInd, Size, << >> , [ ]).

split(BinText, BinInd, Size, Acc, Acc1) ->
	case BinText of
		<<BinInd:Size/binary, Rest/binary>> ->
			split(Rest, BinInd, Size, << >>, [Acc|Acc1]);
		<<X, Rest/binary>> ->
			split(Rest, BinInd, Size, <<Acc/binary, X>>, Acc1);
		<< >> -> 
			rev([Acc|Acc1])
	end.

rev(L) ->
	rev(L,[]).

rev([H|T],Acc) ->
	rev(T,[H|Acc]);
rev([],Acc) ->
	Acc.