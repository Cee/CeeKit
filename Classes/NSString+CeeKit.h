//
//  NSString+CeeKit.h
//  CeeKit
//
//  Created by Cee on 17/02/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CeeKit)

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;
- (NSString *)trim;
- (BOOL)isBlank;

@end
