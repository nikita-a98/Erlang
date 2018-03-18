-module(bs04).
-export([decode_xml/1]).

%%init(File) ->
%%	{ok, Xml} = file:open(File, read),
%%	Xml.
decode_xml(Xml) ->
	decode_xml(Xml, []). % переходим к двум аргум

decode_xml(Xml, Word) ->
	case Xml of
		<<"</", Rest/binary>> ->
			tag_close( Rest, <<>>, Word); % если начинается с "</" то переход к tag_close
		<<"<",Rest/binary>> ->
			tag_open( Rest, <<>>, Word); % если начинается с "<" то переход к tag_open
		<<>> -> [] % если пусой бинарник то вывод
	end.

tag_close(<<">",Rest/binary>>, Acc, [Acc|Word]) ->
	decode_xml(Rest, Word);

tag_close(<<X,Rest/binary>>, Acc, Word) ->
	tag_close(Rest, <<Acc/binary,X>>, Word).


tag_open(<<"</", Rest/binary>>, Acc, [Tag|Word]) ->
	[{Tag, [], [Acc]} | tag_close(Rest, <<>>, [Tag|Word]) ];

tag_open(<<"<", Rest/binary>>, <<>>, [Tag|Word]) ->
	{Tag, [], decode_xml(<<"<",Rest/binary>>, [Tag|Word]) }; % если "<" то записываем в кортеж 

tag_open(<<">",Rest/binary>>, Acc, Word) ->
	tag_open(Rest, <<>>, [Acc|Word]);
 
tag_open(<<X, Rest/binary>>, Acc, Word) ->
	tag_open(Rest, <<Acc/binary,X>>, Word).
