POSAllocationTracker 
====================
POSAllocationTracker is a simple utility for runtime tracking number of
instances of interested classes. To enable tracking you should instrument
allocation replacing standard `alloc` method with `pos_trackingAlloc`:

```objective-c
Dummy *dummy = [[Dummy pos_trackingAlloc] init];
```

After than you can ask `POSAllocationTracker` how much of `Dummy` objects
are still living in your app's memory:

```objective-c
[POSAllocationTracker instanceCountForClass:Dummy.class]
```

Here is a complete demo:

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
        __unused Dummy *dummy = [[Dummy pos_trackingAlloc] init];
        XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 1);
    }
    XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 0);
}

@end
```

## Disabling tracking

POSAllocationTracker tracks instances only in DEBUG mode by default. You turn off or
turn on tracking manually using `POS_DISABLE_ALLOCATION_TRACKING` flag. For example
you can disable tracking in DEBUG mode defining that flag exactly before import
main header of the library:

```objective-c
#define POS_DISABLE_ALLOCATION_TRACKING
#import <POSAllocationTracker/POSAllocationTracker.h>
```
