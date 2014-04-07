//
//  MKDevice+Model_Tests.m
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
