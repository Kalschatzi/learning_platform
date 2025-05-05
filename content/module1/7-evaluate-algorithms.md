+++
title = "Complexity of Algorithms"
type = ""
weight = 7
+++

There are 2 measurements to evaluate the complexity of an algorithm:
## Time Complexity (Efficiency)

Big-O Notation: This describes the upper bound of an algorithm's growth rate as the input size increases. It helps estimate how the algorithm's running time grows with input size (n). Common time complexities include:
* O(1): Constant time
* O(log n): Logarithmic time
* O(n): Linear time
* O(n log n): Log-linear time
* O(n^2): Quadratic time

When discussing time complexity, the focus is on the average/expected cases, but there are different ones:
* Best: Optimized scenario (e.g., sorted input for searching).
* Worst: Most complex scenario (e.g., searching in an unsorted array).
* Average: Expected time for random input.

For example, in the search algorithm on an array, the expected scenario is when you iterate all the elements in search for the one you want, meaning the expected time complexity is O(n).
## Space Complexity

This describes how much memory the algorithm needs as the input size increases. Like time complexity, space complexity is often expressed using Big-O notation.
Consider whether the algorithm uses extra space (like auxiliary data structures or recursion stacks), which might be important for systems with limited memory.


In the end, memory is much cheaper than CPU, so nowadays engineers mostly focus on time complexity.
