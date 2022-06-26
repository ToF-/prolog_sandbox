
/* 

op(+Precedence, +Type, :Name) 

Precedence is an integer between 0 and 1200. Precedence 0 removes the declaration. Type is one of: xf, yf, xfx, xfy, yfx, fy or fx. The‘f’indicates the position of the functor, while x and y indicate the position of the arguments.‘y’should be interpreted as “on this position a term with precedence lower or equal to the precedence of the functor should occur''. For‘x’the precedence of the argument must be strictly lower. The precedence of a term is 0, unless its principal functor is an operator, in which case the precedence is the precedence of this operator. A term enclosed in parentheses ( ... ) has precedence 0.

cf https://www.swi-prolog.org/pldoc/man?predicate=op/3

*/

:- op(500, xfx, 'is_parent').

a is_parent b.    c is_parent g.     f is_parent l.     j is_parent q.
a is_parent c.    c is_parent h.     f is_parent m.     j is_parent r.
a is_parent d.    c is_parent i.     h is_parent n.     j is_parent s.
b is_parent e.    d is_parent j.     i is_parent o.     m is_parent t.
b is_parent f.    e is_parent k.     i is_parent p.

:- op(500, xfx, 'is_sibling_of').

X is_sibling_of Y :-
    Z is_parent X,
    Z is_parent Y,
    X \== Y.

:- op(500, xfx, 'has_depth').

a has_depth 0 :- !.
Node has_depth D :-
    Mother is_parent Node,
    Mother has_depth D1,
    D is D1 + 1.


locate(Node) :-
    path(Node),
    write(Node),
    nl.

path(a).
path(Node) :-
    Mother is_parent Node,
    path(Mother),
    write(Mother),
    write(' --> ').

height(N, H) :-
    setof(Z, ht(N, Z), Set),
    max(Set, 0, H).

ht(Node, 0) :- leaf(Node), !.
ht(Node, H) :-
    Node is_parent Child,
    ht(Child, H1),
    H is H1 + 1.


max([], Max, Max).
max([Head|Tail], Max, Result) :-
    (Head > Max -> max(Tail,Head,Result) ; max(Tail, Max, Result)).

ancestor(a, _) :- true.
ancestor(X,X) :- false.
ancestor(X,Y) :- X is_parent Y.
ancestor(X,Y) :-
    Z is_parent Y,
    ancestor(X, Z).

leaf(X) :-
    not(ancestor(X,_)).


