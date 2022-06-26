take_out(Head, [Head | Tail], Tail).
take_out(Other,[Head | Tail], [Head | Recurse]) :- take_out(Other, Tail, Recurse).

/* now try take_out(X,[1,2,3,4],Y). */

factorial(0, 1).          /* a unit clause has no body */
factorial(N, F) :-        /* a rule clause has a body, cl :- means  'cl is true if' */
    N > 0,                /* the , separator means 'and' */
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

/*
 the factorial of 0 is 1
 the factorial of N is F if N>0 and N1 is N-1 and the factorial of N1 is F1 and F is N*F1
 */

factorial(0, F, F).
factorial(N, A, F) :-
    N > 0,
    A1 is N * A,
    N1 is N - 1,
    factorial(N1, A1, F).


move(1, X, Y, _) :-
    write('move top disk from '),
    write(X),
    write(' to '),
    write(Y),
    nl.
move(N, X, Y, Z) :-
    N > 1,
    M is N - 1,
    move(M, X, Z, Y),
    move(1, X, Y, _),
    move(M, Z, Y, X).

tautology(X,X).

/* foo is not */
foo(P) :- call(P), !, fail.
foo(P).

bachelor(P) :- male(P), not(married(P)).

male(henry).
male(tom).

married(tom).

p(X) :- q(X), not(r(X)).
r(X) :- w(X), not(s(X)).
q(a). q(b). q(c).
s(a). s(c).
w(a). w(b).

