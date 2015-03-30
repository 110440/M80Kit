//
//  NSObject+M80.m
//  M80Kit
//
//  Created by amao on 15/3/30.
//  Copyright (c) 2015年 amao. All rights reserved.
//

#import "NSObject+M80.h"

@implementation NSObject (M80)
- (NSString *)m80AsString
{
    return (NSString *)[self m80AsType:@"NSString"];
}

- (NSNumber *)m80AsNumber
{
    return (NSNumber *)[self m80AsType:@"NSNumber"];
}


- (NSDictionary *)m80AsDictionary
{
    return (NSDictionary *)[self m80AsType:@"NSDictionary"];
}


- (NSArray *)m80AsArray
{
    return (NSArray *)[self m80AsType:@"NSArray"];
}


- (id)m80AsType:(NSString *)className
{
    id obj = nil;
    if (className)
    {
        Class cls = NSClassFromString(className);
        if (cls)
        {
            if ([self isKindOfClass:cls])
            {
                obj = self;
            }
        }
    }
    return obj;
}
@end
