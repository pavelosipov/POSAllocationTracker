//
//  POSAllocationTrackerTests.m
//  POSAllocationTracker
//
//  Created by Osipov on 03.09.15.
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

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSLog(@"-1-");
    [POSAllocationTracker printSnapshot];
    @autoreleasepool {
        Dummy *d = [Dummy new];
        NSLog(@"-2-");
        [POSAllocationTracker printSnapshot];
    }
    NSLog(@"-3-");
    [POSAllocationTracker printSnapshot];
    XCTAssert(YES, @"Pass");
}

@end
