POSAllocationTracker 
====================
POSAllocationTracker is a simple utility for runtime tracking instances of interested classes.
Tracker automatically watches for all classes which are using directly or indirectly `init` method
of NSObject for initialization. Tracking is enable in DEBUG builds only, so it will not affect
performance of release builds. Library is extremelly simple to use. There is only one class with
single method in it: 

```objective-c
[POSAllocationTracker instanceCountForClass:Dummy.class]
```

Here is a complete demo from unit tests of the library:

```objective-c
@interface Dummy : NSObject
@end

@implementation Dummy
@end

@interface POSAllocationTrackerTests : XCTestCase

@end

@implementation POSAllocationTrackerTests

- (void)testInstanceCounterCorrectness {
    XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 0);
    @autoreleasepool {
        __unused Dummy *dummy = [Dummy new];
        XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 1);
    }
    XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 0);
}

@end
```
