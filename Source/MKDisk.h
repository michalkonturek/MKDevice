//
//  MKDisk.h
//  MKDevice
//
//  Created by Michal Konturek on 27/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKDisk : NSObject

+ (NSNumber *)usedDiskSpaceInBytes;
+ (NSNumber *)freeDiskSpaceInBytes;
+ (NSNumber *)totalDiskSpaceInBytes;

@end
