%a. For a list of integer numbers, define a predicate to write twice in
% list every prime number.
% b. For a heterogeneous list, formed from
% integer numbers and list of numbers, define a predicate to write in
% every sublist twice every prime number.
%


%is_prime_rec(X: the number to be checked, D: a possible divisor of X)
%flow model: (i,i) - determinist

is_prime_rec(X, D) :-
    X mod D =:= 0,
    !,
    false.
is_prime_rec(X, D) :-
    D =< X div 2,
    !,
    NewD is D+1,
    is_prime_rec(X, NewD).
is_prime_rec(X, D) :-
    D > X div 2,
    !,
    true.

%is_prime(X: the number to be checked)
%flow model: (i) - determinist
is_prime(X) :- X < 2, !, false.
is_prime(2) :- !, true.
is_prime(X) :-
    X > 2,
    is_prime_rec(X, 2).


%dublate_primes(L: initial list, Res: the result list)
%flow model:(i, o) - determinist, (i,i) - determinist

dublate_primes([], Res) :- Res = [].
dublate_primes([H|T], Res) :-
    is_prime(H),
    !,
    dublate_primes(T, Res1),
    Res = [H, H | Res1].
dublate_primes([H|T], Res) :-
    dublate_primes(T, Res1),
    Res = [H|Res1].

%b)

%dublate_primes_hom(L: initial heterogeneous list, Res)
%flow model: (i, i) - determinist, (i, o) - determinist

dublate_primes_het([], Res) :- Res = [].
dublate_primes_het([H|T], Res) :-
    not(is_list(H)),
    dublate_primes_het(T, Res1),
    Res = [H|Res1].
dublate_primes_het([H|T], Res) :-
    is_list(H),
    dublate_primes(H, HDoubled),
    dublate_primes_het(T, Res1),
    Res = [HDoubled | Res1].
