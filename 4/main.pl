%fib(N,F).
fib(1,0).
fib(2,1).
fib(N,F) :- 
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1,F1),
    fib(N2,F2),
    F is F1 + F2.

vyber([], []).
vyber([H|T], [F|Fs]) :-
    fib(H, F),
    vyber(T, Fs).

b(a,b).
b(b,c).
b(c,d).
b(a,e).
b(e,d).
b(b,e).
e(X,Y):-b(X,Y).
e(X,Y):-b(Y,X).

cesta(X,Y,P):- cesta(X,Y,[],P).
cesta(X,X,A,P):- reverse(A,P).
cesta(X,Y,A,P):- e(X,Z),
                not(member(Z,A)),
                cesta(Z,Y,[X|A],P).



vypis([]).
vypis([H|T]):- write(H),
               nl,
               vypis(T).

b(a,b).
b(a,c).
b(a,d).
b(b,c).
b(b,d).
b(c,d).
b(c,e).
b(d,e).
e(X,Y):- b(X,Y).
e(X,Y):- b(Y,X).

odstran([],_,[]).
odstran([H|L1], L2, L3):- member(H,L2),
                          odstran(L1,L2,L3).
                        
odstran([H|L1],L2,[H|L3]):- not(member(H,L2)), odstran(L1,L2,L3).
                          

tah(H,[],A,R):- reverse([H|A],R).
tah([X,Y], EL, A, R):- member([Y,Z],EL), Z\=X,
                       odstran(EL,[[X,Y],[Y,X],[Y,Z],[Z,Y]], EL1),
                       tah([Y,Z],EL1,[[X,Y]|A], R).

jednat(R):- findall([X,Y], e(X,Y), EL),
            member(H,EL),
            tah(H,EL,[],R).

p([0,0]).
p([1,0]).
p([0,1]).
p([1,1]).
p([0,2]).
p([2,0]).
p([1,2]).
p([2,1]).
p([2,2]).

tah([X,Y],[X1,Y1]):- X1 is X+1, Y1 is Y+2.
tah([X,Y],[X1,Y1]):- X1 is X+2, Y1 is Y+1.
tah([X,Y],[X1,Y1]):- X1 is X-1, Y1 is Y+2.
tah([X,Y],[X1,Y1]):- X1 is X-2, Y1 is Y+1.
tah([X,Y],[X1,Y1]):- X1 is X-1, Y1 is Y-2.
tah([X,Y],[X1,Y1]):- X1 is X-2, Y1 is Y-1.
tah([X,Y],[X1,Y1]):- X1 is X+1, Y1 is Y-2.
tah([X,Y],[X1,Y1]):- X1 is X+2, Y1 is Y-1.

kun(X,X,A,R):- reverse([X|A], R).
kun(X,Y,A,R):- tah(X,Z), p(Z),
               not(member(Z,A)),
               kun(Z,Y,[X|A],R).

kun(X,Y,R):- kun(X,Y,[],R).



