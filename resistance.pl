
series(R1, R2, Re) :- Re is R1 + R2.
parallel(R1, R2, Re) :- Re is ((R1 * R2) / (R1 + R2)).

%  ?- parallel(10,40,R3),series(R3,12,R4),parallel(R4,30,R5).
%  R3 = 8,
%  R4 = 20,
%  R5 = 12.
