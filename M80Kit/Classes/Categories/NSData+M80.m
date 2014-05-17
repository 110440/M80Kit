//
//  NSData+M80.m
//  M80Kit
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import "NSData+M80.h"


@implementation NSData (M80)
- (NSString *)m80BinaryToHex
{
    NSMutableString *hexString = [[NSMutableString alloc]init];
    unsigned char *bytes = (unsigned char *)[self bytes];
    for(NSUInteger i = 0; i < [self length]; i++)
    {
        [hexString appendFormat:@"%02x",bytes[i]];
    }
    return [hexString copy];
}
@end
