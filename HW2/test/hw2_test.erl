-module(hw2_test).
-include_lib("eunit/include/eunit.hrl").


bs01_test() -> [
    ?assertEqual(<<"Some">>, bs01:first_word(<<"Some text">>)),
	?assertEqual(<<"a">>, bs01:first_word(<<"a b c">>)),
	?assertEqual(<<"a">>, bs01:first_word(<<"a">>)),
	?assertEqual(<<".">>, bs01:first_word(<<".  text">>)),
	?assertEqual(<< >>, bs01:first_word(<<"">>)),
	?assertEqual(<< >>, bs01:first_word(<< >>))
	].

bs02_test() -> [	
	?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], bs02:words(<<"Text with four words">>)),
	?assertEqual([<<".">>, <<"text">>], bs02:words(<<". text">>)),
	?assertEqual([<<"a">>, <<"b">>, <<"c">>], bs02:words(<<"a b c">>)),
	?assertEqual([<<"a">>], bs02:words(<<"a">>)),
	?assertEqual([<<>>], bs02:words(<<"">>)),
	?assertEqual([<<>>], bs02:words(<< >>))
	].

bs03_test() -> [	
	?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>], bs03:split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-")),
	?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], bs03:split(<<"Text with four words">>, " ")),
	?assertEqual([<<" ">>, <<"Col1">>, <<"Col2">>, <<"Col3">>], bs03:split(<<" --Col1--Col2--Col3">>, "--")),
	?assertEqual([<<"a">>,<<"bc ">>,<<"d= ">>, <<"100">>], bs03:split(<<"a+bc +d= +100">>, "+")),
	?assertEqual([<<"text">>], bs03:split(<<"text">>, " ")),
	?assertEqual([<<"text">>, <<>>], bs03:split(<<"text//">>, "//")),
	?assertEqual([<<>>], bs03:split(<<>>, " "))
	].

bs04_test() -> [	
	?assertEqual(
		{<<"start">>, [], [
 			{<<"item">>, [], [<<"Text1">>]},
 			{<<"item">>, [], [<<"Text2">>]}
		]}, bs04:decode_xml(<<"<start><item>Text1</item><item>Text2</item></start>">>)),
	?assertEqual(
		{<<"start">>, [], [
			{<<"br">>, [], [<<>>]},
			{<<"item">>, [], [<<"Text1">>]}
		]}, bs04:decode_xml(<<"<start><br></br><item>Text1</item></start>">>)),
	?assertEqual(
	].

-endif.