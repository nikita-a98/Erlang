-module(my_cache_test).

-include_lib("eunit/include/eunit.hrl").

create_test_() -> [
	?_assert(my_cache:create() =:= table)
].

insert_test_() -> [
	?_assert(my_cache:insert("Key","Value", 60) =:= true),
	?_assert(my_cache:insert("Nick","Perso", 600) =:= true)
].

