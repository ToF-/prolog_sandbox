change_dollar([Halfs,Quarters,Dimes,Nickels,P]) :-
    member(Halfs,    [0,1,2]),
    member(Quarters, [0,1,2,3,4]),
    member(Dimes,    [0,1,2,3,4,5,6,7,8,9,10]),
    member(Nickels,  [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]),
    S is 50 * Halfs + 25 * Quarters + 10 * Dimes + 5 * Nickels,
    S =< 100,
    P is 100 - S.
