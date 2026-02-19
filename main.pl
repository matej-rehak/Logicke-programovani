%zena(kdo).
zena(alena).
zena(jana).
zena(tereza).
zena(eva).
zena(ivana).
%muz(kdo).
muz(tomas).
muz(olda).
muz(honza).
muz(patrik).
muz(peter).
%rodic(kdo,koho).
rodic(alena,tereza).
rodic(alena,honza).
rodic(tomas,tereze).
rodic(tomas,honza).
rodic(jana,eva).
rodic(jana,patrik).
rodic(olda,eva).
rodic(olda,patrik).
rodic(eva,ivana).
rodic(eva,peter).
rodic(honza,ivana).
rodic(honza,peter).
%matka(kde,koho).
matka(X,Y):-zena(X),rodic(X,Y).
%babicka(kde,koho).
babicka(X,Y):- matka(X,Z),rodic(Z,Y).
%bratr(kdo, koho).
bratr(X,Y):- muz(X),rodic(Z,X),rodic(Z,Y),x\=y.
%stryc(kdo, koho).
stryc(X,Y):- bratr(X,Z),rodic(Z,Y).
b(1).
b(2).
b(3).
b(4).
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
