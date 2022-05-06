% Andrew Eeckman, ECS 140A, 914834317

% Allows for quick verification of large chessboards. 
% Example Usage: 
% 	len_and_queens(L, 8, Q) yields L = 92, Q = [[..],[..],..,[..]]
% 	len_and_queens(L, 4, [2, 4, 1, 3]) yields L = 4 as Q has 4 elements (i.e. L = N)
len_and_queens(L, N, Q) :- queens(N, Q), length(Q, L). 

% If Q is empty (i.e. user is looking for all possible solutions to an NxN board)
queens(N, Q) :- findall(Q, n_queens(N, Q), Q), !.

% If Q is not empty (i.e. user is checking to see if Q is a possible solution
% on an NxN board.
queens(N, Q) :- n_queens(N, Q), !.

n_queens(N, Q) :-
    findall(Num_To_Add, between(1, N, Num_To_Add), L),
    permutation(L, Q),
    prep_D(L, Q, D1, 1), 
    prep_D(L, Q, D2, 0),
    check(D1, D2).

prep_D([H_of_L | T_of_L], [H_of_Q | T_of_Q], [H_of_D | D], BOOL) :-
    (   BOOL =:= 1 
    ->  H_of_D is H_of_L + H_of_Q
    ;   H_of_D is H_of_L - H_of_Q
    ),
    prep_D(T_of_L, T_of_Q, D, BOOL).

prep_D([], [], [], _) :- !.

check([H_D1 | T_D1], [H_D2 | T_D2]) :-
    \+member(H_D1, T_D1), \+member(H_D2, T_D2),
   	check(T_D1, T_D2).
check([], []) :- !.


