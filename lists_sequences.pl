car([H|T],H).
cdr([H|T],T).
cons(H,T,[H|T]).

member(X, [X|R]).
member(X, [Y|R]) :- member(X,R).

takeout(X, [X|R], R).
takeout(X, [F|R],[F|S]) :- takeout(X,R,S).

append([X|Y],Z,[X|W]) :- append(Y,Z,W).
append([],X,X).

memberr(X, [_|R]) :- memberr(X,R).
memberr(X, [X|_]).

reverse([X|Y],Z,W) :- reverse(Y,[X|Z],W).
reverse([],X,X).



