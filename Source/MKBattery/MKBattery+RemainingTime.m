//
//  MKBattery+RemainingTime.m
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

#import "MKBattery+RemainingTime.h"

#define METHOD_NOT_IMPLEMENTED METHOD(@"%@: NOT IMPLEMENTED.")

#define METHOD(MSG) @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:MSG, NSStringFromSelector(_cmd)] userInfo:nil];

@implementation MKBattery (RemainingTime)

- (NSNumber *)estimatedRemainingMinutesForInternetOn3G {
    METHOD_NOT_IMPLEMENTED
}

- (NSNumber *)estimatedRemainingMinutesForInternetOnWiFi {
    METHOD_NOT_IMPLEMENTED
}

- (NSNumber *)estimatedRemainingMinutesForFaceTime {
    METHOD_NOT_IMPLEMENTED
}

- (NSNumber *)estimatedRemainingMinutesForTalkTime2G {
    METHOD_NOT_IMPLEMENTED
}

- (NSNumber *)estimatedRemainingMinutesForTalkTime3G {
    METHOD_NOT_IMPLEMENTED
}

- (NSNumber *)estimatedRemainingMinutesForAudioPlayback {
    METHOD_NOT_IMPLEMENTED
}

//- (NSNumber *)estimatedRemainingMinutesForAudioPlaybackViaBluetooth {
//    METHOD_NOT_IMPLEMENTED
//}

- (NSNumber *)estimatedRemainingMinutesForVideoPlayback {
    METHOD_NOT_IMPLEMENTED
}

//- (NSNumber *)estimatedRemainingMinutesForYouTube {
//    METHOD_NOT_IMPLEMENTED
//}
//
//- (NSNumber *)estimatedRemainingMinutesForReading {
//    METHOD_NOT_IMPLEMENTED
//}

//- (NSNumber *)estimatedRemainingMinutesForPhotoTaking {
//    METHOD_NOT_IMPLEMENTED
//}
//
//- (NSNumber *)estimatedRemainingMinutesForVideoRecording {
//    METHOD_NOT_IMPLEMENTED
//}
//
//- (NSNumber *)estimatedRemainingMinutesFor2DGame {
//    METHOD_NOT_IMPLEMENTED
//}
//
//- (NSNumber *)estimatedRemainingMinutesFor3DGame {
//    METHOD_NOT_IMPLEMENTED
//}
//
//- (NSNumber *)estimatedRemainingMinutesForGPSNavigation {
//    METHOD_NOT_IMPLEMENTED
//}
//
//- (NSNumber *)estimatedRemainingMinutesForLEDTorch {
//    METHOD_NOT_IMPLEMENTED
//}

- (NSNumber *)estimatedRemainingMinutesForStandby {
    METHOD_NOT_IMPLEMENTED
}

@end
