To prevent this, use weak references to prevent crashes.  This ensures the selector doesn't attempt to access deallocated memory.

Example using weak references:
```objectivec
__weak MyObject *weakObj = obj;
[self performSelector:@selector(myMethodWithWeakObj:) withObject:weakObj afterDelay:2.0];

- (void)myMethodWithWeakObj:(MyObject *)weakObj {
    if (weakObj) {
        // Use weakObj here
    }
}
```

Another, often preferred, approach is to use blocks:
```objectivec
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
    if(obj){
       [self myMethod:obj];
    }
});
```

Both of these solutions avoid potential crashes by either checking for nil or ensuring the object is strongly referenced within a block.