%4. The list a1... an is given. Write a predicate to determine all sublists strictly ascending of this list a.

%is_valid(L: the list)
%flow model: (i) - deterministic

%checks if a list has more than one element
is_valid([_,_ | _]).


%generate_sublist(L: the original list, Res: the resulting sublist)
%the flow model: (i, o) - non-deterministic, (i,i) - deterministic.

%generates the ascending sublists of a list.

generate_sublist([_|T], Res) :-
    generate_sublist(T, Res).

generate_sublist(L, Res) :-
    sublist_start_with_first(L, Res1),
    is_valid(Res1),
    Res = Res1.


% sublist_start_with_first(L: the original list, Res: a sublist starting
% with the first element of the list L).
% flow model: (i, o) : non-deterministic, (i,i) - deterministic

% gets all the increasing sublists of a list, which start with the first
% element of that list (if there is no such sublist, the empty list and
% the first element will be returned)


sublist_start_with_first(_, []).

sublist_start_with_first([H1, H2|_], Res):-
        H1 >= H2,
        !,
        Res = [H1].

sublist_start_with_first([H|T], Res) :-
        sublist_start_with_first(T, Res1),
        Res = [H|Res1].


%main(L: the list, Res: the list of all increasing sublists of L)
%flow model: (i, o) - deterministic, (i,i) - deterministic

%gets the set of all the increasing sublists of L
main(L, ResFinal):-
    findall(Res, generate_sublist(L, Res), ResFinal).


