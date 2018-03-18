-module(bs04_test).

-include_lib("eunit/include/eunit.hrl").

decode_xml_test() ->
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
		{<<"start">>, [], [
			{<<"br">>, [], [
				{<<"p">>, [], [<<"Text">>]} 
				]},
			{<<"item">>, [], [<<"Text1">>]}
		]}, bs04:decode_xml(<<"<start><br><p>Text</p></br><item>Text1</item></start>">>)).
