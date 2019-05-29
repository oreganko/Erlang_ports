%%%-------------------------------------------------------------------
%%% @author Ja
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. maj 2019 15:52
%%%-------------------------------------------------------------------
-module(mathserver).
-author("Ja").
-export([start/0, add/2]).

start() -> register(mathserver, spawn(fun() -> loop() end)).

loop() ->
  receive
    {From, {add, First, Second}} -> From ! {mathserver, First + Second}, loop()
  end.

add(First, Second) ->
  mathserver ! {self(), {add, First, Second}},
  receive
    {mathserver, Reply} -> Reply
  end.



