%%%-------------------------------------------------------------------
%%% @author Ja
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. maj 2019 17:22
%%%-------------------------------------------------------------------
-module(pong).
-author("Ja").
-export([start/0, pong/1]).

start() -> register(pongserver, spawn(fun() -> loop() end)).

loop() ->
  receive
    {From, {pong, Argument}} -> io:format("~w~n", [Argument]), From ! {pongserver, pong}, loop()
  end.

pong(Argument) ->
  pongserver ! {self(), {pong, Argument}},
  receive
    {pongserver, Reply} -> Reply
  end.
