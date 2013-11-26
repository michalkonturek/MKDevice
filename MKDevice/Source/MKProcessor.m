//
//  MKProcessor.m
//  MKDevice
//
//  Created by Michal Konturek on 26/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKProcessor.h"

#import "MKMacros.h"

@implementation MKProcessor

+ (NSNumber *)appUsageCPU {
    METHOD_NOT_IMPLEMENTED
}

+ (NSInteger)activeProcessorCount {
    return [[NSProcessInfo processInfo] activeProcessorCount];
}

+ (NSInteger)processorCount {
    return [[NSProcessInfo processInfo] processorCount];
}

@end
