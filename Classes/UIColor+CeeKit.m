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

- (UIColor *)darkenWithAmount:(double)amount
{
    NSAssert(amount >= 0 && amount <= 1.f, @"Amount must be in range from 0 to 1.");
    
    const CGFloat *colors = CGColorGetComponents(self.CGColor);
    CGFloat red = colors[0];
    CGFloat green = colors[1];
    CGFloat blue = colors[2];
    CGFloat alpha = colors[3];
    
    red *= amount;
    green *= amount;
    blue *= amount;
    
    UIColor *darkenColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:alpha];
    return darkenColor;
}

- (UIColor *)lightenWithAmount:(double)amount
{
    NSAssert(amount >= 0 && amount <= 1.f, @"Amount must be in range from 0 to 1.");
    
    const CGFloat *colors = CGColorGetComponents(self.CGColor);
    CGFloat red = colors[0];
    CGFloat green = colors[1];
    CGFloat blue = colors[2];
    CGFloat alpha = colors[3];
    
    red = red + (255.f - red) * amount;
    green = green + (255.f - green) * amount;
    blue = blue + (255.f - blue) * amount;
    
    UIColor *lightenColor = [UIColor colorWithRed:red
                                            green:green
                                             blue:blue
                                            alpha:alpha];
    return lightenColor;
}

- (UIColor *)mixWithColor:(UIColor *)color
{
    const CGFloat *colors = CGColorGetComponents(self.CGColor);
    CGFloat red = colors[0];
    CGFloat green = colors[1];
    CGFloat blue = colors[2];
    CGFloat alpha = colors[3];
    
    const CGFloat *mixColors = CGColorGetComponents(color.CGColor);
    CGFloat mixRed = mixColors[0];
    CGFloat mixGreen = mixColors[1];
    CGFloat mixBlue = mixColors[2];
    CGFloat mixAlpha = mixColors[3];
    
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