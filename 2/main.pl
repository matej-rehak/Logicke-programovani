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
cesta(Z, Do, C, [Z1|P]): - h(Z, Z1, C1), cesta(Z1, Do, C2, P), C is C1 + C2.

%pocet(List, Pocet).
pocet([], 0).
pocet([H|T], N):- pocet(T, N1), N is N1 + 1.

%suma(List, Suma).
suma([], 0).
suma([H|T], S):- suma(T, S1), S is S1 + H.

%prvek(List, Prvek).
prvek(X,[X|_]).
prvek(X[_|T]):- prvek(X,T).

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

suda_na_licha_p(List, Result) :-
    licha_p(List, LichaList),   
    suda_c(LichaList, Result).  

licha_na_suda_p(List, Result) :-
    suda_p(List, SudaList),     
    licha_c(SudaList, Result).  


