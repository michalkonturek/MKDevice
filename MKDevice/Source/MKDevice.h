//
//  MKDevice.h
//  MKDevice
//
//  Created by Michal Konturek on 18/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKDevice : NSObject

+ (NSInteger)connectedAccessoriesCount;
+ (NSArray *)connectedAccessories;

+ (BOOL)hasAnyAccessoryConnected;
+ (BOOL)isJailbroken;

@end
