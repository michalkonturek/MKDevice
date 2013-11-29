//
//  MKBattery+RemainingTime.h
//  MKDevice
//
//  Created by Michal Konturek on 29/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKBattery.h"

@interface MKBattery (RemainingTime)

- (NSNumber *)estimatedRemainingMinutesForInternetOnWiFi;
- (NSNumber *)estimatedRemainingMinutesForInternetOn3G;

- (NSNumber *)estimatedRemainingMinutesForFaceTime;
- (NSNumber *)estimatedRemainingMinutesForTalkTime2G;
- (NSNumber *)estimatedRemainingMinutesForTalkTime3G;

- (NSNumber *)estimatedRemainingMinutesForAudioPlayback;
//- (NSNumber *)estimatedRemainingMinutesForAudioPlaybackViaBluetooth;
- (NSNumber *)estimatedRemainingMinutesForVideoPlayback;
//- (NSNumber *)estimatedRemainingMinutesForYouTube;
//- (NSNumber *)estimatedRemainingMinutesForReading;

//- (NSNumber *)estimatedRemainingMinutesForPhotoTaking;
//- (NSNumber *)estimatedRemainingMinutesForVideoRecording;

//- (NSNumber *)estimatedRemainingMinutesFor2DGame;
//- (NSNumber *)estimatedRemainingMinutesFor3DGame;

//- (NSNumber *)estimatedRemainingMinutesForGPSNavigation;
//- (NSNumber *)estimatedRemainingMinutesForLEDTorch;
- (NSNumber *)estimatedRemainingMinutesForStandby;

@end
