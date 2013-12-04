//
//  MKDeviceModel.h
//  MKDevice
//
//  Created by Michal Konturek on 29/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKDeviceModel : NSObject

+ (instancetype)createWithJSON:(id)json;

+ (instancetype)modelForCode:(NSString *)code;
+ (instancetype)modelForIdentifier:(NSString *)identifier;

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *identifiers;
@property (nonatomic, strong) NSDictionary *models;

@property (nonatomic, strong) NSString *chipCPU;
@property (nonatomic, strong) NSString *chipGPU;

@property (nonatomic, strong) NSNumber *batteryTimeForAudioPlayback;
@property (nonatomic, strong) NSNumber *batteryTimeForVideoPlayback;
@property (nonatomic, strong) NSNumber *batteryTimeForStandby;

@property (nonatomic, strong) NSNumber *batteryTimeForInternetOn3G;
@property (nonatomic, strong) NSNumber *batteryTimeForInternetOnLTE;
@property (nonatomic, strong) NSNumber *batteryTimeForInternetOnWiFi;

@property (nonatomic, strong) NSNumber *batteryTimeForTalkOn3G;

- (instancetype)initWithJSON:(id)json;

@end
