# CSCI 305: Programming Languages

### Prolog Part 1

**Reading:** Webster Ch. 19

### Instructions
0. [Install Prolog on Your System](https://wwu-pi.github.io/tutorials/lectures/lsp/010_install_swi_prolog.html)
1. [Watch This Video](https://youtu.be/9svYrlaOS7I) - (19:04)
2. [Watch This Video](https://youtu.be/tEMiwwmEx4o) - (16:09)
3. [Watch This Video](https://youtu.be/98cNuh_6tpI) - (19:57)
4. [Watch This Video](https://youtu.be/Y33oufaJ_CE) - (15:37)
2. Review the [Lecture Slides](slides/Lecture33.pdf)
3. Review the [Example Code](https://github.com/CSCI305/csci305-prolog-examples/tree/master/prolog1)
6. Attend Class and Complete the In Class Exercises
7. Check Your Learning

### In Class Exercises
In the following exercises you should implement sets as lists, where each element of a set appears exactly once in its list, but in no particular order. Do not assume you can sort the lists. Do assume that input lists have no duplicate elements, and do guarantee that output lists have no duplicate elements.

#### Exercise 1
Define the `isMember` predicate so that `isMember(X, Y)` says that element `X` is a member of set `Y`. Do not use the predefined list predicates.

#### Check Your Learning:

##### Solution:
```prolog
    isMember(X, [X|_]).
    isMember(X, [_|Tail]) :- isMember(X,Tail).
```

#### Exercise 2
Define the `isUnion` predicate so that `isUnion(X, Y, Z)` says that the union of `X` and `Y` is `Z`. Do not use the predefined list predicates. Your predicate may choose a fixed order for `Z`. If you query `isUnion([1,2], [3], Z)` it should find a binding for `Z`, but it need not succeed on both `isUnion([1], [2], [1,2])` and `isUnion([1], [2], [2, 1])`. Your predicate need not work well when `X` or `Y` are unbound variables.

#### Check Your Learning:

##### Solution:
```prolog
    isUnion([Head|Tail],Y,Z) :- isMember(Head,Y), isUnion(Tail,Y,Z).
    isUnion([Head|Tail],Y,[X|Z]) :- not(isMember(Head,Y)), isUnion(Tail,Y,Z).
    isUnion([],Y,Y).
```

#### Exercise 3
Define the `isIntersection` predicate so that `isIntersection(X, Y, Z)` says that the intersection of `X` and `Y` is `Z`. Do not use the predefined list predicates. Your predicate may choose a fixed order for `Z`. Your predicate need not work well when `X` or `Z` are unbound variables.

#### Check Your Learning:

##### Solution:
```prolog
    isIntersection([Head|Tail],Y,[Head|Z]) :- isMember(Head,Y), isIntersection(Tail,Y,Z).
    isIntersection([Head|Tail],Y,Z) :- not(isMember(Head,Y)), isIntersection(Tail,Y,Z).
    isIntersection([],_,[]).
```
