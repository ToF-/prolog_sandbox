

% find_min(3,7,X) will state that X = 3, because with X=3, Y=7, then X =< Y, and we can stop evaluation here. 
% find_min(9,5,X) will not evaluate as find_min(X,Y,X) because then X =< Y is false.
% find_min(9,5,Y) will state that Y = 5, because with X=9, Y=5, then X > Y.
find_min(X, Y, X) :- X =< Y, !.
find_min(X, Y, Y) :- X > Y.
