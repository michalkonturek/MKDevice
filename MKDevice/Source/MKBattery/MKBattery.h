//
//  MKBattery.h
//  MKDevice
//
//  Created by Michal Konturek on 28/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKBattery : NSObject

+ (void)enableBatteryMonitoring;
+ (void)disableBatteryMonitoring;

+ (BOOL)isCharging;
+ (BOOL)isConnectedToPower;
+ (BOOL)isFullyCharged;

+ (NSNumber *)powerLevel;

@end
