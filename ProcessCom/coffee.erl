-module(coffee).
-export([serve/2, customer/0, coffee/0, start/0]).

% Unified serve function for both coffee and pie
serve(CustomerPid, Item) ->
    CustomerPid ! Item.

customer() ->
    receive
        coffee ->
            io:format("Customer has received the coffee!~n"),
            io:format("Yumm coffee~n"),
            % Continue waiting for more messages
            customer();
        pie ->
            io:format("Ooohhh pie!~n"),
            customer();
        tea ->
            io:format("OOOOlonng tea!~n"),
            customer()
    end.

coffee() ->
    io:format("Brewing coffee~n").

start() ->
    CustomerPid = spawn(coffee, customer, []),
    % Initially serve coffee
    serve(CustomerPid, coffee).
