//
//  UIColor+CeeKit.h
//  CeeKit
//
//  Created by Cee on 20/02/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef unsigned int CeeColorType;

@interface UIColor (CeeKit)

+ (UIColor *)colorWithRGBHexColor:(CeeColorType)hexColor;
+ (UIColor *)colorWithRGBAHexColor:(CeeColorType)hexColor;
+ (UIColor *)colorWithRGBHexString:(NSString *)rgbHexString;
+ (UIColor *)colorWithRGBAHexString:(NSString *)rgbaHexString;

@end
