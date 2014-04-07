//
//  MKDeviceModel.h
//  MKDevice
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>

@interface MKDeviceModel : NSObject

+ (instancetype)createWithJSON:(id)json;

+ (instancetype)modelForCode:(NSString *)code;
+ (instancetype)modelForIdentifier:(NSString *)identifier;
+ (NSString *)modelStringForIdentifier:(NSString *)identifier;

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *slogan;
@property (nonatomic, strong) NSString *identifier;
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
