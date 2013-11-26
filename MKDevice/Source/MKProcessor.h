//
//  MKProcessor.h
//  MKDevice
//
//  Created by Michal Konturek on 26/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKProcessor : NSObject

+ (NSNumber *)appUsageCPU;

+ (NSInteger)activeProcessorCount;
+ (NSInteger)processorCount;

@end
