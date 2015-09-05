POSAllocationTracker 
====================
[![Version](http://img.shields.io/cocoapods/v/POSAllocationTracker.svg)](http://cocoapods.org/?q=POSAllocationTracker)

POSAllocationTracker is a simple utility for runtime tracking class' instances.
Tracker automatically watches for all classes which are using directly or indirectly `init` method
of `NSObject` during initialization. Tracking is enable in DEBUG builds only, so it doesn't not affect
performance of release builds. The idea of the library was born during reading Facebook's article
[Reducing FOOMs in the Facebook iOS app](https://code.facebook.com/posts/1146930688654547/reducing-fooms-in-the-facebook-ios-app/).
Library is extremelly simple to use. There is only one class with a single method in it: 

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
