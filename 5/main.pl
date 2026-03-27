p([0,0]).
p([1,0]).
p([0,1]).
p([1,1]).
p([0,2]).
p([2,0]).
p([1,2]).
p([2,1]).
p([2,2]).

odstran([],_,[]).
odstran([H|L1], L2, L3):- member(H,L2),
                          odstran(L1,L2,L3).
                        
odstran([H|L1],L2,[H|L3]):- not(member(H,L2)), odstran(L1,L2,L3).

cord(X,Y).
cord(X,Y):- findall(cx,p[cx,_],cxl),
            sort(cxl,x),
            findall(cy,p[_,cy], cyl),
            sort(cyl,ys),
            reverse(ys,y).

%object(id,s1,s2,s3)
o(1,[X,Y],[X,Y1],[X,Y2]):- Y is Y+1, Y2 is Y+2.
o(1,[X,Y],[X1,Y],[X2,Y]):- X is X+1, X2 is X+2.
o(1,[X,Y],[X,Y1],[X,Y2]):- Y is Y-1, X2 is X+2.
o(1,[X,Y],[X,Y1],[X,Y2]):- Y is Y-1, X2 is X-1.
o(1,[X,Y],[X,Y1],[X,Y2]):- Y is Y+1, X2 is X+1.
o(1,[X,Y],[X,Y1],[X,Y2]):- Y is Y+1, X2 is X-1.

vypln(R):- findall(S,p(S),SL),
           vypln1(SL,R).

vypln1([],[]).
vypln1(SL,[[id,S1,S2,S3]|R]):- member(S1,SL), o(id,S1,S2,S3), member(S2,SL), member(S3,SL), odstran(SL,[S1,S2,S3], SLNew), vypln1(SlNew,R). 



