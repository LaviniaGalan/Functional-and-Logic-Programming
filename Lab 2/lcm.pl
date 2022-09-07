%gcd(A:integer, B:integer, R:integer - the great common divisor of A
% and B)
%(i, i, o) - deterministic, (i,i,i) - deterministic

gcd(A,0,R):-
    R is A, !.
gcd(A,B,R):-
    B =\= 0,
    C is B, D is A mod B,
    gcd(C, D, R1),
    R is R1.

%lcm(L: list, R: integer - the least common multiple of the list)
%(i, o) - deterministic, (i, i) - deterministic

lcm([], R):-
    R is 0, !.
lcm([L1|[]], R):-
    R is L1, !.
lcm([L1|L], R):-
    lcm(L,R1),
    gcd(L1,R1,Gcd),
    R is L1*R1/Gcd.

