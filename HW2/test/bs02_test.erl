-module(bs02_test).

-include_lib("eunit/include/eunit.hrl").

words_test() ->
	?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], bs02:words(<<"Text with four words">>)),
	?assertEqual([<<".">>, <<"text">>], bs02:words(<<". text">>)),
	?assertEqual([<<"a">>, <<"b">>, <<"c">>], bs02:words(<<"a b c">>)),
	?assertEqual([<<"a">>], bs02:words(<<"a">>)),
	?assertEqual([<<>>], bs02:words(<<"">>)),
	?assertEqual([<<>>], bs02:words(<< >>)).