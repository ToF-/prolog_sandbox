
nand(false,false,true).
nand(false,true,true).
nand(true,false,true).
nand(true,true,false).

nnot(I, R) :- nand(I,I,R), !.

and(I1, I2, R) :- nand(I1,I2,R0), nnot(R0,R), !.
or(I1, I2, R) :- nnot(I1,R0), nnot(I2,R1), nand(R0,R1,R), !.


