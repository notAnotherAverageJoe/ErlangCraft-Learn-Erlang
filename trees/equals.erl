-module(equals).
-export([equals/2, test_pawn_move/0]).

% How to Run:
% Open the erlang shell and enter the code below.
% 1> c(equals).
% {ok,equals}
% 2> equals:test_pawn_move().
% Are the two game states equal? false
% ok

% Function to compare two trees (chess states)
equals(nil, nil) ->
    true;
equals({Value1, Left1, Right1}, {Value2, Left2, Right2}) ->
    % Recursive calls on equals
    (Value1 =:= Value2) and (equals(Left1, Left2)) and (equals(Right1, Right2));
equals(_, _) ->
    false.

% Function to test the scenario: Moving a White Pawn from b2 to b3
test_pawn_move() ->
    % Initial pawn state at b2 (row 2, column 2)
    InitialPawnState = {"Pawn", {2, 2}, nil, nil},

    % New pawn state after moving to b3 (row 3, column 2)
    MovePawnState = {"Pawn", {3, 2}, nil, nil},

    % Representing the game states as binary tree nodes

    % Pawn at b2
    State1 = {InitialPawnState, nil, nil},
    % Pawn at b3
    State2 = {MovePawnState, nil, nil},

    % Testing if the two states are equal
    Result = equals(State1, State2),

    % Output the result of the comparison
    io:format("Are the two game states equal? ~p~n", [Result]).

% Expected output: false (since the pawn has moved)
% Moving the pawn from 2,2 => 2,3

%   8 | .  .  .  .  .  .  .  .
%   7 | .  .  .  .  .  .  .  .
%   6 | .  .  .  .  .  .  .  .
%   5 | .  .  .  .  .  .  .  .
%   4 | .  .  .  .  .  .  .  .
%   3 | .  .  .  .  .  .  .  .
%   2 | .  P  .  .  .  .  .  .
%   1 | .  .  .  .  .  .  .  .
%     -------------------------
%       a  b  c  d  e  f  g  h

%   8 | .  .  .  .  .  .  .  .
%   7 | .  .  .  .  .  .  .  .
%   6 | .  .  .  .  .  .  .  .
%   5 | .  .  .  .  .  .  .  .
%   4 | .  .  .  .  .  .  .  .
%   3 | .  P  .  .  .  .  .  .
%   2 | .  .  .  .  .  .  .  .
%   1 | .  .  .  .  .  .  .  .
%     -------------------------
%       a  b  c  d  e  f  g  h


%   8 | r  n  b  q  k  b  n  r
%   7 | p  p  p  p  p  p  p  p
%   6 | .  .  .  .  .  .  .  .
%   5 | .  .  .  .  .  .  .  .
%   4 | .  .  .  .  .  .  .  .
%   3 | .  .  .  .  .  .  .  .
%   2 | P  P  P  P  P  P  P  P
%   1 | R  N  B  Q  K  B  N  R
%     -------------------------
%       a  b  c  d  e  f  g  h
