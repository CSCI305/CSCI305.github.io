# CSCI 305: Programming Languages

### Prolog Part 2

**Reading:** Webster Ch. 20

### Instructions
1. [Watch This Video](https://youtu.be/TYgR7y4nfvU) - (47:10)
2. Review the [Lecture Slides](slides/Lecture34_36.pdf)
3. [Review the Example Code](https://github.com/CSCI305/csci305-prolog-examples/blob/master/prolog2/game.pl)
4. Attend Class and Complete the In Class Exercises
5. Check Your Learning

### In Class Exercises

#### Exercise
Add the following featurs to the adventure game from the prolog example code linked above:

* There is a gate between the fork in the path and the mountaintop. The gate is a separate location; that is, the player must move from `at(you,fork)` to `at(you,gate)` and then to `at(you,mountaintop)`.
* To move forward throught the gate the player must first unlock it with a key.
* The key is somewhere in the maze. The player must find it and explicitly pick it up.
* If the player tries to pass through the gate while still holding the key, he or she is killed by lightning. (To get the treasure, the player must first open the gate, then put down the key, and then pass through.)

**Note**: Part of your implementation should be a general way for the player to pick things up, carry them, and put them down. Design your solution so that it would be easy to add additional objects for the player to pick up and put down.
