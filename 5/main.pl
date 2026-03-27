:- dynamic p/1.
:- dynamic p/2.

p([0,0]).
p([1,0]).
p([0,1]).
p([1,1]).
p([0,2]).
p([2,0]).
p([1,2]).
p([2,1]).
p([2,2]).

odstran([], _, []).
odstran([H|L1], L2, L3) :- member(H, L2), !, odstran(L1, L2, L3).
odstran([H|L1], L2, [H|L3]) :- odstran(L1, L2, L3).

o(1,[X,Y],[X,Y1],[X,Y2])  :- Y1 is Y+1, Y2 is Y+2.
o(2,[X,Y],[X1,Y],[X2,Y])  :- X1 is X+1, X2 is X+2.
o(3,[X,Y],[X,Y1],[X2,Y])  :- Y1 is Y+1, X2 is X+1.
o(4,[X,Y],[X1,Y],[X1,Y2]) :- X1 is X+1, Y2 is Y+1.
o(5,[X,Y],[X,Y1],[X1,Y1]) :- Y1 is Y+1, X1 is X+1.
o(6,[X,Y],[X1,Y],[X1,Y1]) :- Y1 is Y-1, X1 is X+1.

vypln(R) :- findall(S, p(S), SL), vypln1(SL, R).

vypln1([], []).
vypln1(SL, [[Id,S1,S2,S3]|R]) :-
    member(S1, SL),
    o(Id, S1, S2, S3),
    member(S2, SL),
    member(S3, SL),
    odstran(SL, [S1,S2,S3], SLNew),
    vypln1(SLNew, R).

reset :-
    retractall(p(_)),
    retractall(p(_,_)),
    pole([0,1,2,3,4,5,6,7,8,9], [0,1,2,3,4,5,6,7,8,9]),
    write('   --- --- --- --- --- --- --- --- --- --- '), nl,
    vypis_pole.

pole([], _).
pole([H|SX], SY) :- pole1(H, SY), pole(SX, SY).

pole1(_, []).
pole1(X, [Y|SY]) :- assert(p([X,Y],' ')), pole1(X, SY).

vypis_pole :-
    findall(X, p([X,_],_), XL), sort(XL, XLS),
    findall(Y, p([_,Y],_), YL), sort(YL, YLS1),
    reverse(YLS1, YLS),
    board(XLS, YLS).

board(_, []).
board(SX, [Y|SY]) :-
    write(Y), write(' | '),
    board1(SX, Y), nl,
    write('   --- --- --- --- --- --- --- --- --- --- '), nl,
    board(SX, SY).

board1([], _).
board1([X|SX], Y) :- p([X,Y], H), write(H), write(' | '), board1(SX, Y).

th(S) :- p(S,' '), retract(p(S,' ')), assert(p(S, o)), vypis_pole.

tp :- p(S,' '), retract(p(S,' ')), assert(p(S, x)), vypis_pole, nl, write(S).¨
#a

 



