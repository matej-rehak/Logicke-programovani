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

%h(odkud, kam).
h(a,e,4).
h(a,b,1).
h(c,d,3).
h(e,d,5).
h(b,c,2).

%cesta(z, Do)
cesta(Z, Do) :- h(Z, Do, _).
cesta(Z, Do) :- h(Z, Do, _).
cesta(Z, Do, Cena) :- h(Z, Do, Cena).
cesta(Z, Do, Cena) :- h(Z, Z1, C1), cesta(Z1, Do, C2), Cena is C1 + C2.

cesta(Z, Do, C, []):- h(Z, Do, C).
cesta(Z, Do, C, [Z1|P]):- h(Z, Z1, C1), cesta(Z1, Do, C2, P), C is C1 + C2.

%suma(List, Suma).
suma([], 0).
suma([H|T], S):- suma(T, S1), S is S1 + H.

%suda_p(List, SudaList).
suda_p([],[]).
suda_p([_],[]).
suda_p([_,B|T1], [B|T2]) :- suda_p(T1, T2).

%licha_p(List, LichaList).
licha_p([],[]).
licha_p([A|T1], [A|T2]) :- licha_p(T1, T2).

licha_c([],[]).
licha_c([A|T1], [A|T2]) :- 1 is A mod 2, licha_c(T1, T2).
licha_c([H|T1], T2) :- 0 is H mod 2, licha_c(T1, T2).

suda_na_licha_p([],[]).
suda_na_licha_p([H|T1], [H|T2]) :- 0 is H mod 2, suda_na_licha_p(T1, T2).
suda_na_licha_p([_|T1], T2) :- suda_na_licha_p(T1, T2).

%nat(cislo).
nat(0).
nat(X):- nat(X1), X is X1 + 1.

i(1).
f([3]).
d(1,a,3).
d(1,a,2).
d(2,b,2).
d(2,a,1).
ka(S,[]):- f(FS), member(S,FS), write('END').
ka(S,[H|T]):- nl, write(S), write(' '), atom_chars(W,[H|T]), write(W), d(S,H,S1), write('->'), write(S1), ka(S1,T).

start:- write('Zadej slovo:'),
        read(W),
        atom_chars(W, WL),
        i(S), ka(S, WL).

obarvi(A,B,C,D,E,F,G):- b(A),b(B),A\=B, b(C), A\=C, b(D), A\=D, B\=D, C\=D, b(E), B\=E, D\=E, b(F), C\=F, D\=F, b(G), D\=G, E\=C, F\=G.
vypln(A,B,C,D,E,F,G,H,I):-
    b(A), b(B), b(C),
    R1 is A+B+C,
    b(D), b(G),
    S1 is A+D+G, R1=S1,
    b(E), b(F),
    R2 is D+E+F,
    b(H),
    S2 is B+E+H, R2=S2,
    b(I),
    R3 is G+H+I,
    S3 is C+F+I, R3=S3.
fakt(0,1).
fakt(N,F):-
    N>0,
    N1 is N-1,
    fakt(N1,F1),
    F is F1*N.

prefix(W,L,P):-
    atom_chars(W, WL),
    append(PL, SL, WL),
    length(PL, L),
    atom_chars(P, PL).

pozice(X, Y, Z):-
    atom_chars(X, XL),
    atom_chars(Y, YL),
    append(P,S, YL),
    append(XL, _, S),
    length(P, Z1),
    Z is Z1 + 1.