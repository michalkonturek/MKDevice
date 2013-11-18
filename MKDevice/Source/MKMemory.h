//
//  MKMemory.h
//  MKDevice
//
//  Created by Michal Konturek on 18/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKMemory : NSObject

+ (NSNumber *)activeMemory;
+ (NSNumber *)inactiveMemory;
+ (NSNumber *)freeMemory;
+ (NSNumber *)totalMemory;
+ (NSNumber *)usedMemory;
+ (NSNumber *)wiredMemory;

@end
