-module(hello).
-export([greetings/0]).

greetings() ->
    io:format("Hello, World!~n").

% Eshell V14.2.5.2 (press Ctrl+G to abort, type help(). for help)
% 1> c(hello).
% {ok,hello}
% 2> hello:greetings().
% Hello, World!
% ok
