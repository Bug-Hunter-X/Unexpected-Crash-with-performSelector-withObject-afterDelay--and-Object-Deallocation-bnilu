# Objective-C - Unexpected Crash with performSelector:withObject:afterDelay:

This repository demonstrates a subtle bug in Objective-C related to the use of `performSelector:withObject:afterDelay:` and the potential for crashes when the object passed as `withObject:` is deallocated before the selector is executed.

The `bug.m` file contains the buggy code. The `bugSolution.m` file shows how to fix the issue using weak references or blocks, providing alternative methods to prevent unexpected crashes.