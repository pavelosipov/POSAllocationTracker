//
//  POSAllocationTrackerTests.m
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import <XCTest/XCTest.h>

#define POS_DISABLE_ALLOCATION_TRACKING
#import "POSAllocationTracker.h"


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
