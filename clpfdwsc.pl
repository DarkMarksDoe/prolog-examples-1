:- module(clpfdwsc, [go/1]).

:-use_module(library(clpfd)).

go(M) :-
    wsc([[0,0,0,0]], M),
    flatten(M, FM),
    label(FM).

wsc([[1,1,1,1]|R], [[1,1,1,1]|R]).
wsc([[F,W,S,C]|R], M) :-
    [NF, NW, NS, NC] = NM,
    NM ins 0..1,
    NF #\= F, % move the farmer
    % move max one thing
    NW #= W #/\ NS #= S  #\/
    NS #= S #/\ NC #= C  #\/
    NW #= W #/\ NC #= C,
    % game rules
    NS #= NC #==> NF #= NS,
    NW #= NS #==> NF #= NW,
    wsc([NM, [F,W,S,C] | R], M).

