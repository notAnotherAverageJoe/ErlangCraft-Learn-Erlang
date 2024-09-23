-module(helloName).
-export([start/0]).

start() ->
    io:format("Hello! and welcome to Erlang! what is your name? "),
    % Get user input
    Name = io:get_line(""),
    % Remove newline character
    NameTrimmed = string:trim(Name),
    io:format("Nice to meet you, ~s!~n", [NameTrimmed]).

% 1> c(helloName).
% {ok,helloName}
% 2> helloName:start().
% Hello! and welcome to Erlang! what is your name?
% Joe
% Nice to meet you, Joe!
% ok
