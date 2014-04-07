//
//  MKDeviceModelTests.m
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

#import "MKDeviceModel.h"

@interface MKDeviceModelTests : XCTestCase

@end

@implementation MKDeviceModelTests

- (void)test_modelForCode_for_all_codes {
    id models = @[@"iPhone4", @"iPhone4s",
                  @"iPhone5", @"iPhone5c", @"iPhone5s", @"Simulator", @"Unknown"];
    id expected_results = @[@"iPhone 4", @"iPhone 4s",
                            @"iPhone 5", @"iPhone 5c", @"iPhone 5s", @"Simulator", @"Unknown"];

    NSInteger idx = 0;
    for (id input in models) {
        id expected = [expected_results objectAtIndex:idx];
        id model = [MKDeviceModel modelForCode:input];

        id result = [model name];
        assertThat(result, equalTo(expected));
        
        idx++;
    }
}

- (void)test_modelForIdentifier_returns_Unknown {
    id identifiers = @[@"Unknown", @"Asad", @""];
    id expected = @"Unknown";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForIdentifier:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForIdentifier_returns_Simulator {
    id identifiers = @[@"i386", @"x86_64"];
    id expected = @"Simulator";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForIdentifier:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForIdentifier_returns_iPhone4 {
    id identifiers = @[@"iPhone3,1", @"iPhone3,2", @"iPhone3,3"];
    id expected = @"iPhone 4";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForIdentifier:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForIdentifier_returns_iPhone4s {
    id identifiers = @[@"iPhone4,1"];
    id expected = @"iPhone 4s";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForIdentifier:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForIdentifier_returns_iPhone5 {
    NSArray *identifiers = @[@"iPhone5,1", @"iPhone5,2"];
    id expected = @"iPhone 5";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForIdentifier:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForIdentifier_returns_iPhone5c {
    NSArray *identifiers = @[@"iPhone5,3", @"iPhone5,4"];
    id expected = @"iPhone 5c";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForIdentifier:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

- (void)test_modelForIdentifier_returns_iPhone5s {
    NSArray *identifiers = @[@"iPhone6,1", @"iPhone6,2"];
    id expected = @"iPhone 5s";
    
    for (id identifier in identifiers) {
        id model = [MKDeviceModel modelForIdentifier:identifier];
        id result = [model name];
        assertThat(result, equalTo(expected));
    }
}

@end
