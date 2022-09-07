%insert_Rec(L: list, V: integer - the value to be inserted, M: unsigned
% - the power of 2 after which we have to insert currently, I: unsigned
% - the current position in the list, LRez: list - the result)
%(i,i,i,i,o) - deterministic, (i,i,i,i,i) - deterministic

insert_Rec([],_,_,_,LRez):-
    LRez = [], !.
insert_Rec([H],V,M,I,LRez):-
    I =:= M,
    LRez = [H,V], !.
insert_Rec(L,V,M,I,LRez):-
    I =:= M+1,
    NEWM is M*2,
    insert_Rec(L,V,NEWM,I,LRez1),
    LRez = [V|LRez1].
insert_Rec([L1|L],V,M,I,LRez):-
    NEWI is I+1,
    insert_Rec(L,V,M,NEWI,LRez1),
    LRez = [L1|LRez1].

% insert(L: list, V: integer - the value to be inserted, LRez: list -
% the result)
% (i,i,o) - deterministic, (i,i,i) - deterministic

insert(L,V,LRez):-
    insert_Rec(L,V,1,1,LRez1),
    LRez = LRez1, !.



