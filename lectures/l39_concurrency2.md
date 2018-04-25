# CSCI 305: Programming Languages

### Concurrency

### Instructions
1. [Watch the Video](https://youtu.be/crx36iT9wVg) - (34:41)
2. Review the following Notes of Java Concurrency
    - [Some Basics](https://courses.cs.ut.ee/MTAT.08.022/2016_spring/uploads/Main/notes.pdf)
3. Work through this tutorial
    - [A Good Tutorial](http://www.vogella.com/tutorials/JavaConcurrency/article.html)
4. Come to class and work on the In-class exercises
5. [Example Code](https://github.com/CSCI305/csci305-java-examples/tree/master/src/main/java/concurrent)

### In Class Exercises

#### Exercise 1
Using your new found knowlege on Java Threading. Use the Fork-Join Framework to develop a parallel implementation of MergeSort.

#### Check Your Learning:

##### Solution:
<!--
```java
package sort;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveTask;

public class MergeSortTask extends RecursiveTask<List<Integer>> {

    public static void main(String args[]) {
        Random rand = new Random();
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < 10000; i++) {
            list.add(rand.nextInt(100));
        }

        ForkJoinPool pool = new ForkJoinPool(8);
        MergeSortTask task = new MergeSortTask(list);
        BigDecimal start;
        BigDecimal end;
        start = new BigDecimal(System.nanoTime());
        list = pool.invoke(task);
        end = new BigDecimal(System.nanoTime());
        System.out.println("FJ  Time Required: " + (end.subtract(start)));

        list = new ArrayList<>();
        for (int i = 0; i < 100000; i++) {
            list.add(rand.nextInt(10000));
        }

        start = new BigDecimal(System.nanoTime());
        list = new MergeSortTask(list).recursiveMergeSort(list);
        end = new BigDecimal(System.nanoTime());
        System.out.println("Rec Time Required: " + (end.subtract(start)));

    }

    List<Integer> list;

    public MergeSortTask(List<Integer> list) {
        this.list = list;
    }

    @Override
    protected List<Integer> compute() {
        if (list.size() > 2) {
            MergeSortTask task1 = new MergeSortTask(list.subList(0, list.size() / 2));
            MergeSortTask task2 = new MergeSortTask(list.subList(list.size() / 2, list.size()));

            task1.fork();
            task2.fork();

            List<Integer> list1 = task1.join();
            List<Integer> list2 = task2.join();

            merge(list1, list2, list);
            return list;
        } else if (list.size() == 2) {
            swap(list);

            return list;
        } else {
            return list;
        }
    }

    public List<Integer> recursiveMergeSort(List<Integer> list) {
        if (list.size() < 2)
            return list;
        if (list.size() == 2) {
            swap(list);

            return list;
        } else {
            List<Integer> list1 = recursiveMergeSort(list.subList(0, list.size() / 2));
            List<Integer> list2 = recursiveMergeSort(list.subList(list.size() / 2, list.size()));

            merge(list1, list2, list);
            return list;
        }
    }

    private void swap(List<Integer> list) {
        int first = list.get(0);
        int second = list.get(1);

        if (first > second) {
            list.set(0, second);
            list.set(1, first);
        }
    }

    private void merge(List<Integer> list1, List<Integer> list2, List<Integer> list) {
        for (int i = 0, j = 0, k = 0; i < list.size(); i++) {
            if (j >= list1.size()) {
                list.set(i, list2.get(k));
                k += 1;
            } else if (k >= list2.size() || list1.get(j) < list2.get(k)) {
                list.set(i, list1.get(j));
                j += 1;
            } else {
                list.set(i, list2.get(k));
                k += 1;
            }
        }
    }
}
```
-->
#### Exercise 2
Implement a parallel approach to finding the average of a list containing 1 million `long` numbers. Using `System.nanoTime()` to calculate the amount of nanonseconds needed for the computation, use this to compare against a sequential approach using a for loop.

#### Check Your Learning:

##### Solution:
<!--
`SumTask.java`
```java
package average;

import java.util.List;
import java.util.concurrent.RecursiveTask;

public class SumTask extends RecursiveTask<Long> {

    private List<Long> array;
    private static final int THRESHOLD = 2500;

    public SumTask(List<Long> array) {
        this.array = array;
    }

    @Override
    protected Long compute() {
        if (array.size() < THRESHOLD) {
            long sum = 0;
            for (long i : array) {
                sum += i;
            }

            return sum;
        }
        else {
            SumTask task1 = new SumTask(array.subList(0, array.size() / 2));
            SumTask task2 = new SumTask(array.subList(array.size() / 2, array.size()));

            task1.fork();
            task2.fork();

            long val1 = task1.join();
            long val2 = task2.join();

            long sum = val1 + val2;

            return sum;
        }
    }
}
```

`AverageCalc.java`
```java
package average;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ForkJoinPool;

public class AverageCalc {

    public static void main(String args[]) {
        List<Long> list = new ArrayList<>();
        Random rand = new Random();
        for (int i = 0; i < 10000000; i++) {
            list.add((long)rand.nextInt(500));
        }

        long start = System.nanoTime();
        ForkJoinPool pool = new ForkJoinPool(50);
        Long sum = pool.invoke(new SumTask(list));
        double avg = (double) sum / 10000000;
        System.out.println("Average: " + avg);
        long end = System.nanoTime();
        System.out.println("Time: " + (end - start));

        start = System.nanoTime();
        sum = 0L;
        for (long l : list)
            sum += l;
        avg = (double) sum / 10000000;
        System.out.println("Average: " + avg);
        end = System.nanoTime();
        System.out.println("Time: " + (end - start));


    }
}
```
-->
