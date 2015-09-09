//
//  NSObject+POSAllocationTracker.m
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import "NSObject+POSAllocationTracker.h"
#import "AllocationTracker.h"
#import <objc/runtime.h>

#ifdef DEBUG

inline void POSSwapSelectors(Class aClass, SEL originalSelector, SEL trackingSelector) {
    Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
    assert(originalMethod != NULL);
    Method trackingMethod = class_getInstanceMethod(aClass, trackingSelector);
    method_exchangeImplementations(originalMethod, trackingMethod);
}

@implementation NSObject (POSAllocationTracker)

+ (void)load {
    pos::AllocationTracker::initialize();
    POSSwapSelectors(self, @selector(init), @selector(pos_trackingInit));
    POSSwapSelectors(self, sel_getUid("dealloc"), @selector(pos_trackingDealloc));
}

- (instancetype)pos_trackingInit {
    id object = [self pos_trackingInit];
    pos::AllocationTracker::tracker().incrementInstanceCountForClass([self class]);
    return object;
}

- (void)pos_trackingDealloc {
    pos::AllocationTracker::tracker().decrementInstanceCountForClass([self class]);
    [self pos_trackingDealloc];
}

@end

#endif
