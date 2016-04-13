//
//  POSAllocationTrackerTests.m
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import <XCTest/XCTest.h>
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
        __unused Dummy *dummy = [Dummy new];
        XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 1);
    }
    XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 0);
}

- (void)testResetAllCounters {
    XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 0);
    __unused Dummy *dummy = [Dummy new];
    XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 1);
    [POSAllocationTracker resetAllCounters];
    XCTAssert([POSAllocationTracker instanceCountForClass:Dummy.class] == 0);
}

@end
