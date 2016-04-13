//
//  AllocationTracker.cpp
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#include "AllocationTracker.h"
#include <stdlib.h>

namespace pos {

static AllocationTracker *g_tracker = nullptr;

void AllocationTracker::initialize() {
    g_tracker = new AllocationTracker();
}

AllocationTracker &AllocationTracker::tracker() {
    return *g_tracker;
}

AllocationTracker::AllocationTracker() {}
    
uint64_t AllocationTracker::instanceCountForClass(Class aClass) {
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    auto snapshotEntry = snapshot_.find(aClass);
    if (snapshotEntry != snapshot_.end()) {
        return snapshotEntry->second;
    }
    return 0;
}
    
void AllocationTracker::incrementInstanceCountForClass(Class aClass) {
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    ++snapshot_[aClass];
}

void AllocationTracker::decrementInstanceCountForClass(Class aClass) {
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    auto snapshotEntry = snapshot_.find(aClass);
    if (snapshotEntry != snapshot_.end()) {
        --snapshotEntry->second;
    }
}
    
void AllocationTracker::resetAllCounters() {
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.clear();
}

}
