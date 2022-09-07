%check(L:the list, E: the element)
%(i,i)
%
check([],_) :- false, !.
check([E|_], E) :- true, !.
check([H|T],E):-
    H=\=E,
    check(T,E).
