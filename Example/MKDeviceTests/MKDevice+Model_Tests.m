//
//  MKDevice+Model_Tests.m
//  MKDevice
//
//  Created by Michal Konturek on 04/12/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "MKDevice+Model.h"

@interface MKDevice_Model_Tests : XCTestCase

@end

@implementation MKDevice_Model_Tests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)test_deviceTypeStirng_for_all_models {
    id fixtures = @[
                    @{@"input": @"iPhone3,1", @"expected": @"iPhone 4 GSM"},
                    @{@"input": @"iPhone3,2", @"expected": @"iPhone 4 GSM (Rev A)"},
                    @{@"input": @"iPhone3,3", @"expected": @"iPhone 4 CDMA"},
                    @{@"input": @"iPhone4,1", @"expected": @"iPhone 4s"},
                    @{@"input": @"iPhone5,1", @"expected": @"iPhone 5 GSM"},
                    @{@"input": @"iPhone5,2", @"expected": @"iPhone 5 Global"},
                    @{@"input": @"iPhone5,3", @"expected": @"iPhone 5c GSM"},
                    @{@"input": @"iPhone5,4", @"expected": @"iPhone 5c Global"},
                    @{@"input": @"iPhone6,1", @"expected": @"iPhone 5s GSM"},
                    @{@"input": @"iPhone6,2", @"expected": @"iPhone 5s Global"},
                    @{@"input": @"i386", @"expected": @"Simulator i386"},
                    @{@"input": @"x86_64", @"expected": @"Simulator x86_64"},
                    @{@"input": @"Unknown", @"expected": @"Unknown"},
                    @{@"input": @"iPhone2000", @"expected": @"Unknown"}
                    ];
    
    for (id fixture in fixtures) {
        id input = [fixture objectForKey:@"input"];
        id expected = [fixture objectForKey:@"expected"];
        
        id result = [MKDeviceModel modelStringForIdentifier:input];
        
        assertThat(result, equalTo(expected));
    }
}

@end
