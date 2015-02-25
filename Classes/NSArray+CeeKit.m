//
//  NSArray+CeeKit.m
//  CeeKit
//
//  Created by Cee on 25/02/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import "NSArray+CeeKit.h"

@implementation NSArray (CeeKit)

- (NSNumber *)sum
{
    return [self valueForKeyPath:@"@sum.self"];
}

- (NSNumber *)average
{
    return [self valueForKeyPath:@"@avg.self"];
}

@end