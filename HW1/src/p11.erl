-module(p11).
-export([encode_modified/1]).

encode_modified(List) -> encode_modified(List,1).

encode_modified([],_) -> [];
encode_modified([H, H|T], Acc) -> encode_modified([H|T], Acc+1);
encode_modified([H|T], 1) -> [H | encode_modified(T, 1)];
encode_modified([H|T], Acc) -> [{Acc, H} | encode_modified(T, 1)].
