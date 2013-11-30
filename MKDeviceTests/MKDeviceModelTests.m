//
//  MKDeviceModelTests.m
//  MKDevice
//
//  Created by Michal Konturek on 30/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "MKDeviceModel.h"

@interface MKDeviceModelTests : XCTestCase

@end

@implementation MKDeviceModelTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_modelForID_returns_iPhone61 {
    id identifier = @"iPhone6,1";
    id expected = @"iPhone 5s";
    
    id model = [MKDeviceModel modelForID:identifier];
    id result = [model modelName];
    
    assertThat(result, equalTo(expected));
}

//- (void)testExample {
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

@end
