# README
Student Name: Andrew Eeckman <br> 
Student ID: 914834317 <br>
Date: 11/17/21 <br>

## Part 1 Predicates:
### my_concat(L1, L2, L)
This predicate simply states that list L is the concatenation of two lists, L1 and L2. It checks this using recursion. The program recursively removes the head of both L1 and L, checking to see if both match. Once L1 is empty, it checks to make sure the remaining L is equal to L2. If all three inputs are given, the program will simply test whether or not L is actually the concatenation of the two other lists inputted. If one of the inputs is left out, however, the program will return the matching list required to produce a true as stated above. <br> <br>
Examples: <br>
?- my_concat([1, 2, 3], [4, 5], [1, 2, 3, 4, 5]) is true. <br>
?- my_concat([1, 2, 3], [8, 5], [1, 2, 3, 4, 5]) is false. <br>
?- my_concat(X, [4, 5], [1, 2, 3, 4, 5]) yields X = [1, 2, 3]. <br>
?- my_concat([1, 2, 3], X, [1, 2, 3, 4, 5]) yields X = [4, 5]. <br>
?- my_concat([1, 2, 3], [4, 5], X) yields X = [1, 2, 3, 4, 5]. <br>

### my_element_at(X, N, L)
This predicate checks to see if the given element X is the Nth element in a list L. It does so by using recursion, moving down the list (by popping its head) and continually checking if the current head is equal to X while incrementing an indexing variable. L is the only required parameter for this predicate but it must be paired with at least one other to work. It can check for truth statements as well as find out what element is located at what position in a list. It can also find out what index an element is located at in a list. (Note: Indexes start at 1, not 0)<br><br>
Examples:<br>
?- my_element_at(2, 1, [2, 3, 4]) is true. <br>
?- my_element_at(2, 2, [2, 3, 4]) is false. <br>
?- my_element_at(2, X, [2, 3, 4]) yields X = 1. <br>
?- my_element_at(X, 1, [2, 3, 4]) yields X = 2. <br>

### my_reverse(L1, L2)
This predicate either checks if L2 is the reverse of L1 or takes in a given list and outputs its reversed counterpart. It does so by using a third list as storage. The head of L1 is continually appended to this third list until L1 is empty. Then the program checks to see if the storage list is equivalent to that of the reversed one. Only one input is required but two can be given.<br><br>
Examples:<br>
?- my_reverse([1, 2, 3], [3, 2, 1]) is true. <br>
?- my_reverse([1, 2, 3], [3, 1, 2]) is false. <br>
?- my_reverse([1, 2, 3], X) yields X = [3, 2, 1]. <br>
?- my_reverse(X, [3, 2, 1]) yields X = [1, 2, 3]. <br>

### my_flatten(L1, L2)
This predicate either checks to see if an L1, when flattened, is equivalent to a given L2 or it removes all the nested lists from L1, flattening it, and then producing a flattened list L2. The program does this by first reducing L1 into a collection of singular elements and then concatenating them into a singular list. If this singular list is equal to the given flat list, true is return. If a flat list is not given, this newly generated one is returned. (Note: L1 is a required input) <br><br>
Example:<br>
?- my_flatten([[1], [2, 3]], [1, 2, 3]) returns true. <br>
?- my_flatten([[1], [2, 3]], [1, 2, 4]) returns false. <br>
?- my_flatten([[1], [2, 3]], X) yields X = [1, 2, 3]. <br>

### my_compress(L1, L2)
This predicate either checks to see if an L1, when devoid of duplicated elements, is equivalent to a given L2 or it removes all the duplicates from L1 and then produces a compressed list L2. The program does this by first checking to see if the head of L1's value can be found anywhere else in L1. If it can, the program the program drops the head and continues through the remaining list. If it cannot, that mean the head's value is unique. So, the program adds the head's value to a storage list and continues through the rest of the list. Once L1 is empty, it checks to see if the storage list is equivalent to L2. If L2 is not given, the storage list is returned as such. (Note: L1 is a required input) <br><br>
Example:<br>
?- my_flatten([1, 2, 2, 3, 3, 3], [1, 2, 3]) returns true. <br>
?- my_flatten([1, 2, 2, 4, 4, 3, 3, 3], [1, 2, 4]) returns false. <br>
?- my_flatten([1, 2, 2, 3, 3, 3], X) yields X = [1, 2, 3]. <br>

## Part 2 Predicates:
Note: The following predicates work together to solve the given N-Queens problem. To get all possible solutions for an NxN board enter the following (where N is an integer value):<br>
?- queens(N, X)<br>
X will equal a nested list containing all of the solutions requested. <br>
To test whether a solution is valid or not, enter the following (where N is an integer value and L is a list containing N elements):<br>
?- queens(N, L)<br>
The above with either return true or false.<br>

### queens(N, Q)
This predicate has two rules. If Q is left empty, it will return all the solutions for a NxN chessboard. It does this by calling the n_queens(N, Q) predicate for every permutation of 1 to N using the built-in findall() predicate. If Q is not empty, it will called the n_queen predicate for the given list entered in Q. If Q is a valid solution, it will return true, else it will return false. <br>

### n_queens(N, Q)
This predicate generates one solution of the N-Queens problem for an NxN board. It returns it as the list Q. It can also be used to check valid solutions if a Q is manually entered in a queens(N, Q) query. The program accomplishes the above two tasks by first generating a list, L, containing elements from 1 to N (for example, if N = 5, this list will be [1, 2, 3, 4, 5]). Then it generates a random permutation, using the built-in permutation predicate, from this list and stores it in Q. Then it checks to make sure no queen can attack one another along their diagonals using the prep_D() and check() predicates (Note: as Q is generated as a permutation of L, we need not worry about checking rows, there exists no duplicates in Q). The predicate prep_D() will be called twice, once with its BOOL value set to 1 and the other time with it set to 0 in order to accommodate diagonals both left and right of the current queen.<br>

### prep_D(L, Q, D, BOOL)
This predicate is passed the sorted list, L, with values from 1 to N, the permutation Q, an empty list D, and an integer value BOOL. D will store the results of simple rise over run calculations. These results will then be compare in the predicate check() to see if the permutation Q is valid. Depending on the value of BOOL passed, the head of Q will either be added to or subtracted from the head of L. If BOOL is a 1 (calling for addition), we are looking blocking off diagonals to the right of our current queen. If BOOL is a 0 (calling for subtraction), we are blocking off diagonals to the left of our current queen. Regardless of which we are currently asking the program to do, the head of D will be assigned the resulting value. Finally prep_D() will once again be called with the tails of both L and Q. This will continue until both L, Q, and D are empty. Finally, this predicate will return the completed list D back to n_queens().<br>


### check(D1, D2)
This predicate is passed the diagonal lists, D1 and D2, generated by the two calls to prep_D() in n_queens(). It has a simple role, to ensure that the elements of each list are unique in respect to the other elements of that same list. The program accomplishes this by checking to see if the current head of both lists can be found in their respective tails (i.e. if the value of that head is repeated later on in the list). If it is, check() returns false, the given permutation contains two queens which can attack each other along a diagonal. To illustrate this, take the following for example:<br>
L = [1, 2, 3, 4], Q = [4, 2, 3, 1]<br>
Adding the elements of these two lists together, we get<br>
D1 = [5, 4, 6, 5].<br>
In this case, check() would return false. This is simply a basic rise over run calculation. If any element in either list is not unique within that list then at least two queens in the given permutation can attack one another. In this case, the queens in columns 1 and 4 are at fault.<br>
Now if check() finds no other value equal to that of the head in the tail of the list, then check() will be called with the tails of both lists. This continual checking will occur until both D1 and D2 are empty.

## Special Predicate for Testing: len_and_queens(L, N, Q):
Used to verify the correct number of solutions on especially large boards, this function calls queens(N, Q) as well as returns the number of solutions found, L. For example:<br>
?- len_and_queens(L, 9, Q) yields L = 352, Q = [[...], [...], ..., [...]]<br> 


## References:
1. https://www.swi-prolog.org/pldoc/man?predicate=append/3
2. https://cs.union.edu/~striegnk/learn-prolog-now/html/node89.html
3. https://www.scss.tcd.ie/~dwoods/1617/CS1LL2/HT/wk8/lec8.pdf
4. https://www.swi-prolog.org/pldoc/man?predicate=member/2
5. https://www.swi-prolog.org/pldoc/man?predicate=length/2
6. https://www.swi-prolog.org/pldoc/man?predicate=findall/3
7. https://stackoverflow.com/questions/4115021/predicate-control-in-prolog (for usage of the ';' operator in prolog).
8. https://stackoverflow.com/questions/23815952/prolog-arguments-are-not-sufficiently-instantiated (in order to understand instantiation errors).
9. https://stackoverflow.com/questions/10202666/prolog-create-a-list (Referenced in creating a list containing elements in order from 1 to N).
10. https://swish.swi-prolog.org/ (the code submitted in this project was developed using this online IDE)

