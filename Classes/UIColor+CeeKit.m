//
//  UIColor+CeeKit.m
//  CeeKit
//
//  Created by Cee on 20/02/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import "UIColor+CeeKit.h"

@implementation UIColor (CeeKit)

+ (UIColor *)colorWithRGBHexColor:(CeeColorType)hexColor
{
    return [UIColor colorWithRed:(hexColor >> 16 & 0xFF) / 255.f
                           green:(hexColor >> 8 & 0xFF) / 255.f
                            blue:(hexColor & 0xFF) / 255.f
                           alpha:1.f];
}

+ (UIColor *)colorWithRGBAHexColor:(CeeColorType)hexColor
{
    return [UIColor colorWithRed:(hexColor >> 24 & 0xFF) / 255.f
                           green:(hexColor >> 16 & 0xFF) / 255.f
                            blue:(hexColor >> 18 & 0xFF) / 255.f
                           alpha:(hexColor & 0xFF) / 255.f];
}

+ (UIColor *)colorWithRGBHexString:(NSString *)rgbHexString
{
    CeeColorType hexColor;
    
    NSScanner *scanner = [NSScanner scannerWithString:rgbHexString];
    return [scanner scanHexInt:&hexColor] ? [self colorWithRGBHexColor:hexColor] : nil;
}

+ (UIColor *)colorWithRGBAHexString:(NSString *)rgbaHexString
{
    CeeColorType hexColor;
    
    NSScanner *scanner = [NSScanner scannerWithString:rgbaHexString];
    return [scanner scanHexInt:&hexColor] ? [self colorWithRGBAHexColor:hexColor] : nil;
}

@end