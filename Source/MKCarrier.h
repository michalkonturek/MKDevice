//
//  MKCarrier.h
//  MKDevice
//
//  Created by Michal Konturek on 19/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CTCarrier;

@interface MKCarrier : NSObject

+ (BOOL)allowsVOIP;

+ (NSString *)carrierName;
+ (NSString *)isoCountryCode;
+ (NSString *)mobileCountryCode;
+ (NSString *)mobileNetworkCode;

@end
