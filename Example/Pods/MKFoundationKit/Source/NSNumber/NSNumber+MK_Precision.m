//
//  NSNumber+MK_Precision.m
//  MKFoundationKit
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

#import "NSNumber+MK_Precision.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Precision)

+ (NSDecimalNumberHandler *)mk_decimalNumberHandlerWithScale:(short)scale {
    return [NSDecimalNumberHandler
            decimalNumberHandlerWithRoundingMode:NSRoundPlain
            scale:scale
            raiseOnExactness:NO
            raiseOnOverflow:NO
            raiseOnUnderflow:NO
            raiseOnDivideByZero:NO
            ];
}

- (instancetype)mk_roundedAsMoney {
    return [self mk_roundedWithPrecision:2];
}

- (instancetype)mk_roundedWithPrecision:(short)precision {
    NSAssert(precision >= 0, @"Precision cannot be negative.");
    NSDecimalNumberHandler *behavior = [NSDecimalNumber mk_decimalNumberHandlerWithScale:precision];
    return [[self mk_decimalNumber] decimalNumberByRoundingAccordingToBehavior:behavior];
}

@end
