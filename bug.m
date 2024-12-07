In Objective-C, a subtle error can occur when using `performSelector:withObject:afterDelay:` with selectors that take parameters. If the object you're passing as `withObject:` is deallocated before the selector is executed, you'll get an exception.  This is because the selector is trying to access memory that's no longer valid.

Example:
```objectivec
MyObject *obj = [[MyObject alloc] init];
[self performSelector:@selector(myMethod:) withObject:obj afterDelay:2.0];
// ... later, obj is released or deallocates before the delay completes
```

This can be especially tricky to debug because the crash occurs some time after the seemingly innocuous `performSelector` call. The crash will usually appear as an exception related to accessing freed memory or a bad access.