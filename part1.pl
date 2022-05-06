% Andrew Eeckman, ECS 140A, 914834317

% Concat
my_concat([], L2, L2) :- !.
my_concat([H_of_L1 | T_of_L1], L2, [H_of_L1 | T_of_L]) :- my_concat(T_of_L1, L2, T_of_L).

% Element_At
my_element_at(H, 1, [H | _]) :- !.
my_element_at(X, N2, [_ | T]) :- my_element_at(X, N1, T), N2 is N1 + 1.

% Reverse
my_reverse(List, Reversed_List) :- my_reverse([], List, Reversed_List).
my_reverse(Reversed_List, [], Reversed_List) :- !.
my_reverse(Storage, [H_of_List | Tail_of_List], Reversed_List) :-
    my_reverse([H_of_List | Storage], Tail_of_List, Reversed_List).

% Flatten
my_flatten([], []) :- !.
my_flatten(Var, [Var]) :- atomic(Var).
my_flatten(L1, L2) :- my_flatten(L1, H_rec, T_rec), my_concat(H_rec, T_rec, L2).
my_flatten([H_of_List | T_of_List], H_rec, T_rec) :-
    my_flatten(T_of_List, T_rec),
    my_flatten(H_of_List, H_rec), !.
                       
% Compress:
my_compress(List, Com_List) :- my_compress([], List, Com_List).
my_compress(Com_List, [], Com_List) :- !.
my_compress(Storage, [H_of_List | T_of_List], Com_List) :- 
    member(H_of_List, T_of_List), !,
    my_compress(Storage, T_of_List, Com_List).
my_compress(Storage, [H_of_List | T_of_List], Com_List) :- 
    my_concat(Storage, [H_of_List], StorageA),
    my_compress(StorageA, T_of_List, Com_List).
    



    
