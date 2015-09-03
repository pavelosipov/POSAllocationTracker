//
//  POSAllocationTracker.m
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import "POSAllocationTracker.h"
#import "NSObject+POSAllocationTracker.h"
#import "AllocationTracker.h"
#import <iostream>
#import <objc/runtime.h>

@implementation POSAllocationTracker

+ (void)printSnapshot {
    for (auto snapshotEntry : pos::AllocationTracker::tracker().snapshot()) {
        if (snapshotEntry.second > 0) {
            NSLog(@"%s: %@", class_getName(snapshotEntry.first), @(snapshotEntry.second));
        }
    }
}

@end
