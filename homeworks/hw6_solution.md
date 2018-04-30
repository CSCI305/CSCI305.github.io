<center>

<h1>CSCI 305 Homework 6</h1>

<h3>Due Date: April 27, 2018 @ Beginning of Class</h3>
<br />
<br />

<h4>Name:<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></h4>

</center>
<br />
<br />
<br />

#### Cost Models
1. For each of the following, give a formula for computing the address to use for the array reference. Assume that the array `A` is allocated as single block at address `base`, and let `size` be the size of an individual array element. (2 points)

* The element `A[i]`, where `0 ≤ i ≤ n`
<br /><br />
**`A[i] -> base + i*size`**
<br /><br />
* The element `A[i][j][k]`, where `0 ≤ i ≤ m`, `0 ≤ j < n`, and `0 ≤ k < p`, and where the array is allocated in column-major order.
<br /><br />
**`A[i][j][k] -> base + (i * p * size) + (j * (m + 1) * p * size) + (k * size)`**
<br />

#### Concurrency
(1) What are the three possible levels of concurrency in programs? (3 points)
<br />
* **Machine instruction level**
* **High-level language statement level**
* **Unit level**
<br />

(2) Describe the logical architecture of an MIMD computer. (3 points)
<br />
* MIMD - Multiple Instruction Multiple Data
  - **Machine with multiple processors each capable of executing their own instructurion stream.**
  - Memory
    - **Distributed - Each processor has its own memory**
    - **Shared - Single memory shared between the processors**
<br />

(3) Define the following terms: (3 points)
  * synchronization:
  <br />
  **A mechanism that controls the order in which tasks execute.**
  <br />
  * deadlock:
  <br />
  **A condition that occurs when two tasks gain control of shared resources and are each awaiting the other to reliquish control of their resource. This condition causes the loss of liveness for both tasks and guarantees that the program will never complete execution correctly.**
  <br />
  * race condition:
  <br />
  **When two or more tasks are racing to use a shared resource and the behavior of the program is dependent on which task arrives first.**
  <br />

(4) What is the best action a system can take when deadlock is detected? (2 points)
<br />
**Resource preemption: resources allocated to various processes may be successively preempted and allocated to other processes until the deadlock is broken.**
<br />

(5) How are explicit locks supported in Java? (2 points)
<br />
**Explicit locks are provided in Java via the Lock interface and its realizations. These provide the methods `lock()` and `unlock()`. Specifically one can use either of the `ReentrantLock` or `ReentrantReadWriteLock`. Once a lock has been instantiated, calling `lock()` on that locks the resource until `unlock()` is called.**
<br />
