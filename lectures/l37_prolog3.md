# CSCI 305: Programming Languages

### Prolog Part 3

**Reading:** Webster Ch. 22

### Instructions
1. [Watch This Video](https://youtu.be/I3VKlYv4OWw) - (43:16)
2. [Watch This Video](https://youtu.be/LQkQlWfZzac) - (15:31)
3. Review the [Lecture Slides](slides/Lecture37.pdf)
4. [Review the Example Code](https://github.com/CSCI305/csci305-prolog-examples/tree/master/prolog3)
5. Attend Class and Complete the In Class Exercises
6. Check Your Learning

### In Class Exercises

#### Exercise 1
Define the prediate `max(X, Y, Z)` that takes numbers `X` and `Y` and unifies `Z` with the maximum of the two.

##### Solution:

```prolog
max(X, Y, Z) :-
  (X >= Y, Z is X, !);
  Z is Y.
```

#### Exercise 2
Define the predicate `subsetsum(L, Sum, SubL)` that takes a list `L` of numbers and a number `Sum` and unifies `SubL` with a subsequence of `L` such that the sum of the numbers in `SubL` is `Sum`. For example:

```
?- subsetsum([1, 2, 5, 3, 2], 5, SubSet).
SubSet = [1,2,2]  ;
SubSet = [2,3]  ;
SubSet = [5]  ;
SubSet = [3,2]  ;
false.
```

Your predicate should assume that `L` and `Sum` are instantiated, and should succeed once for each subsequence of `L` and adds up to `Sum`.

##### Solution:
```prolog
sum([],0).
sum([Head | Rest], X) :-
  sum(Rest,RestS),
  X is Head + RestS.

/* Borrowed From queens.pl */
subseq([],[]).
subseq([Item | RestX], [Item| RestY]) :-
  subseq(RestX, RestY).
subseq(X, [_| RestY]) :-
  subseq(X, RestY).

subsetsum(L, Sum, SubL) :-
  subseq(SubL, L),
  sum(SubL, Total),
  Total =:= Sum.
```
