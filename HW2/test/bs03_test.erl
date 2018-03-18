-module(bs03_test).

-include_lib("eunit/include/eunit.hrl").

words_test() ->
	?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>], bs03:split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-")),
	?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], bs03:split(<<"Text with four words">>, " ")),
	?assertEqual([<<" ">>, <<"Col1">>, <<"Col2">>, <<"Col3">>], bs03:split(<<" --Col1--Col2--Col3">>, "--")),
	?assertEqual([<<"a">>,<<"bc ">>,<<"d= ">>, <<"100">>], bs03:split(<<"a+bc +d= +100">>, "+")),
	?assertEqual([<<"text">>], bs03:split(<<"text">>, " ")),
	?assertEqual([<<"text">>, <<>>], bs03:split(<<"text//">>, "//")),
	?assertEqual([<<>>], bs03:split(<<>>, " ")).