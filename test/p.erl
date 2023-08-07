-module(p).

-export([s/1]).

s(Term)->
    R= io_lib:format("~p",[Term]),
    TermAsStering=lists:flatten(R).
