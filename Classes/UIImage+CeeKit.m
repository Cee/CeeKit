//
//  UIImage+CeeKit.m
//  CeeKit
//
//  Created by Cee on 19/02/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import "UIImage+CeeKit.h"

@implementation UIImage (CeeKit)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    NSAssert(size.width && size.height, @"Width or height can't be zero.");
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
