## my-tools

### list-switch *function*
*index, index, list -> list*

Accepts two indices and a list, returns a new list with the elements at the two indices from the passed list switched with one another.

Example:

    CL-USER> (list-switch 0 1 '(1 2 3 4))
    (2 1 3 4)

### array-switch *function*
*index, index, array -> array*

Accepts two indices and an array, returns a new array with the elements at the two indices from the passed array switched with one another.

Example:

    CL-USER> (array-switch 0 1 '#(1 2 3 4))
    #(2 1 3 4)

### permute *function*
*list -> list*

Accepts a list and returns a new list with all possible permutations of the elements inside the passed list. ***caution: this will overflow the stack if used with lists that have more than 9 elements***

Example:

    CL-USER> (permute '(1 2 3 4 5))
    ((5 3 2 1 4) (3 5 2 1 4) (3 2 5 1 4) (3 2 1 5 4) (3 2 1 4 5) (5 3 2 4 1)
     (3 5 2 4 1) (3 2 5 4 1) (3 2 4 5 1) (3 2 4 1 5) (5 3 4 2 1) (3 5 4 2 1)
     (3 4 5 2 1) (3 4 2 5 1) (3 4 2 1 5) (5 4 3 2 1) (4 5 3 2 1) (4 3 5 2 1)
     (4 3 2 5 1) (4 3 2 1 5) (5 2 3 1 4) (2 5 3 1 4) (2 3 5 1 4) (2 3 1 5 4)
     (2 3 1 4 5) (5 2 3 4 1) (2 5 3 4 1) (2 3 5 4 1) (2 3 4 5 1) (2 3 4 1 5)
     (5 2 4 3 1) (2 5 4 3 1) (2 4 5 3 1) (2 4 3 5 1) (2 4 3 1 5) (5 4 2 3 1)
     (4 5 2 3 1) (4 2 5 3 1) (4 2 3 5 1) (4 2 3 1 5) (5 2 1 3 4) (2 5 1 3 4)
     (2 1 5 3 4) (2 1 3 5 4) (2 1 3 4 5) (5 2 1 4 3) (2 5 1 4 3) (2 1 5 4 3)
     (2 1 4 5 3) (2 1 4 3 5) (5 2 4 1 3) (2 5 4 1 3) (2 4 5 1 3) (2 4 1 5 3)
     (2 4 1 3 5) (5 4 2 1 3) (4 5 2 1 3) (4 2 5 1 3) (4 2 1 5 3) (4 2 1 3 5)
     (5 3 1 2 4) (3 5 1 2 4) (3 1 5 2 4) (3 1 2 5 4) (3 1 2 4 5) (5 3 1 4 2)
     (3 5 1 4 2) (3 1 5 4 2) (3 1 4 5 2) (3 1 4 2 5) (5 3 4 1 2) (3 5 4 1 2)
     (3 4 5 1 2) (3 4 1 5 2) (3 4 1 2 5) (5 4 3 1 2) (4 5 3 1 2) (4 3 5 1 2)
     (4 3 1 5 2) (4 3 1 2 5) (5 1 3 2 4) (1 5 3 2 4) (1 3 5 2 4) (1 3 2 5 4)
     (1 3 2 4 5) (5 1 3 4 2) (1 5 3 4 2) (1 3 5 4 2) (1 3 4 5 2) (1 3 4 2 5)
     (5 1 4 3 2) (1 5 4 3 2) (1 4 5 3 2) (1 4 3 5 2) (1 4 3 2 5) (5 4 1 3 2)
     (4 5 1 3 2) (4 1 5 3 2) (4 1 3 5 2) (4 1 3 2 5) (5 1 2 3 4) (1 5 2 3 4)
     (1 2 5 3 4) (1 2 3 5 4) (1 2 3 4 5) (5 1 2 4 3) (1 5 2 4 3) (1 2 5 4 3)
     (1 2 4 5 3) (1 2 4 3 5) (5 1 4 2 3) (1 5 4 2 3) (1 4 5 2 3) (1 4 2 5 3)
     (1 4 2 3 5) (5 4 1 2 3) (4 5 1 2 3) (4 1 5 2 3) (4 1 2 5 3) (4 1 2 3 5))
