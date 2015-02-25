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
                            blue:(hexColor >> 8 & 0xFF) / 255.f
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

- (UIColor *)darkenWithAmount:(double)amount
{
    NSAssert(amount >= 0 && amount <= 1.f, @"Amount must be in range from 0 to 1.");
    
    CGFloat hue, saturation, brightness, alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    UIColor *darkerColor = [UIColor colorWithHue:hue
                                      saturation:saturation * (1.f + amount)
                                      brightness:brightness * (1.f - amount)
                                           alpha:alpha];
    return darkerColor;
}

- (UIColor *)lightenWithAmount:(double)amount
{
    NSAssert(amount >= 0 && amount <= 1.f, @"Amount must be in range from 0 to 1.");
    
    CGFloat hue, saturation, brightness, alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    UIColor *lighterColor = [UIColor colorWithHue:hue
                                       saturation:saturation * (1.f - amount)
                                       brightness:brightness * (1.f + amount)
                                            alpha:alpha];
    return lighterColor;
}

- (UIColor *)mixWithColor:(UIColor *)color
{
    CGFloat red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGFloat mixRed, mixGreen, mixBlue, mixAlpha;
    [color getRed:&mixRed green:&mixGreen blue:&mixBlue alpha:&mixAlpha];
    
    mixRed = (mixRed + red) / 2.f;
    mixGreen = (mixGreen + green) / 2.f;
    mixBlue = (mixBlue + blue) / 2.f;
    mixAlpha = (mixAlpha + alpha) / 2.f;
    
    UIColor *mixedColor = [UIColor colorWithRed:mixRed
                                          green:mixGreen
                                           blue:mixBlue
                                          alpha:mixAlpha];
    return mixedColor;
}

@end