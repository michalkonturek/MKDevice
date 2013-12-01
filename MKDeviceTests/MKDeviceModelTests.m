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

- (void)test_modelForCode_for_all_codes {
    id models = @[@"iPhone4", @"iPhone4s", @"iPhone5", @"iPhone5c", @"iPhone5s"];
    id expected_results = @[@"iPhone 4", @"iPhone 4s", @"iPhone 5", @"iPhone 5c", @"iPhone 5s"];

    NSInteger idx = 0;
    for (id input in models) {
        id expected = [expected_results objectAtIndex:idx];
        id model = [MKDeviceModel modelForCode:input];

        id result = [model name];
        assertThat(result, equalTo(expected));
        
        idx++;
    }
}

- (void)test_modelForID_returns_iPhone4 {
    id identifiers = @[@"iPhone3,1", @"iPhone3,2", @"iPhone3,3"];
    id expected = @"iPhone 4";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForID:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForID_returns_iPhone4s {
    id identifiers = @[@"iPhone4,1"];
    id expected = @"iPhone 4s";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForID:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForID_returns_iPhone5 {
    NSArray *identifiers = @[@"iPhone5,1", @"iPhone5,2"];
    id expected = @"iPhone 5";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForID:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForID_returns_iPhone5c {
    NSArray *identifiers = @[@"iPhone5,3", @"iPhone5,4"];
    id expected = @"iPhone 5c";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForID:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForID_returns_iPhone5s {
    NSArray *identifiers = @[@"iPhone6,1", @"iPhone6,2"];
    id expected = @"iPhone 5s";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForID:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

@end
