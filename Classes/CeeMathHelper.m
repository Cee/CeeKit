//
//  CeeMathHelper.m
//  CeeKit
//
//  Created by Cee on 25/02/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import "CeeMathHelper.h"

@implementation CeeMathHelper

+ (NSUInteger)generateRandomIntegerFrom:(unsigned int)min to:(unsigned int)max
{
    NSUInteger intValue = arc4random_uniform(max) + min;
    return intValue;
}

@end

