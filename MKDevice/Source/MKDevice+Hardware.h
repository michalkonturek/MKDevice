//
//  MKDevice+Hardware.h
//  MKDevice
//
//  Created by Michal Konturek on 29/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKDevice.h"

#import "MKDeviceModel.h"

//typedef enum _MKDeviceType {
//    MKDeviceTypeUnknown,
//    MKDeviceTypePhone1G,
//    MKDeviceTypePhone3G,
//    MKDeviceTypePhone3GS,
//    MKDeviceTypePhone4,
//    MKDeviceTypePhone4Verizon,
//    MKDeviceTypePodTouch1G,
//    MKDeviceTypePodTouch2G,
//    MKDeviceTypePodTouch3G,
//    MKDeviceTypePodTouch4G,
//    MKDeviceTypePad1,
//    MKDeviceTypePad2Wifi,
//    MKDeviceTypePad2GSM,
//    MKDeviceTypePad2CDMA,
//    MKDeviceTypeSimulator
//} MKDeviceType;

typedef enum _MKDeviceFamily {
    MKDeviceFamilyUnknown,
    MKDeviceFamilyPad,
    MKDeviceFamilyPhone,
    MKDeviceFamilyPod
} MKDeviceFamily;

@interface MKDevice (Hardware)

+ (MKDeviceFamily)deviceFamily;
+ (MKDeviceModel *)deviceModel;

+ (NSString *)deviceTypeString;

+ (NSString *)modelIdentifier;

@end
