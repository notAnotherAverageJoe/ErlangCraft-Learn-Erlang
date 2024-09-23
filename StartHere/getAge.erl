-module(getAge).
-export([askAge/0]).

askAge() ->
    io:format("How old are you? "),
    % Read user input
    AgeString = io:get_line(""),
    % Remove newline character
    AgeStringTrimmed = string:trim(AgeString),
    case parse_age(AgeStringTrimmed) of
        {ok, Age} ->
            io:format("You are ~p years old.~n", [Age]);
        {error, _} ->
            io:format("Invalid age entered. Please enter a valid number for your age.~n")
    end.

parse_age(Value) ->
    try
        Age = list_to_integer(Value),
        {ok, Age}
    catch
        error:_ ->
            {error, invalid_age}
    end.

% Eshell V14.2.5.2 (press Ctrl+G to abort, type help(). 
% for help)
% 1> c(getAge).
% {ok, getAge}
% 3> getAge:askAge().
% 1024
% You are 1024 years old.
% ok
% 4>
