//
//  MKDevice+Model.h
//  MKDevice
//
//  Created by Michal Konturek on 29/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKDevice.h"

#import "MKDeviceModel.h"

@interface MKDevice (Model)

+ (NSString *)deviceType;
+ (NSString *)deviceModelString;

+ (MKDeviceModel *)deviceModel;
+ (NSString *)modelIdentifier;

@end
