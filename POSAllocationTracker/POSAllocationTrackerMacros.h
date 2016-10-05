//
//  POSAllocationTrackerConfig.h
//  POSAllocationTracker
//
//  Created by Osipov on 05/10/16.
//  Copyright © 2016 Pavel Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef POS_ENABLE_RUNTIME_CHECKS
#   ifdef DEBUG
#       define POS_ENABLE_RUNTIME_CHECKS 1
#   endif
#endif

#if POS_ENABLE_RUNTIME_CHECKS
#   define POS_RUNTIME_CHECK(condition) NSParameterAssert((condition))
#else
#   define POS_RUNTIME_CHECK(condition)
#endif
