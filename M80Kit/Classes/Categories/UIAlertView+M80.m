//
//  UIAlertView+M80.m
//  M80Kit
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import "UIAlertView+M80.h"
#import <objc/runtime.h>

@interface M80AlertViewDelegate : NSObject<UIAlertViewDelegate>
@property (nonatomic,strong)    NSMutableDictionary *dict;
@end

@implementation M80AlertViewDelegate
+ (instancetype)sharedDelegate
{
    static M80AlertViewDelegate *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[M80AlertViewDelegate alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _dict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setBlock:(M80UIAlertViewBlock)block
    forAlertView:(UIAlertView *)alertView
{
    NSString *description = [alertView description];
    if (block && description)
    {
        [_dict setObject:[block copy]
                  forKey:description];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *description = [alertView description];
    M80UIAlertViewBlock block = [_dict objectForKey:description];
    if (block)
    {
        block(buttonIndex);
        [_dict removeObjectForKey:description];
    }
}


@end


@implementation UIAlertView (M80)
- (void)m80ShowWithCompletion:(M80UIAlertViewBlock)block
{
    self.delegate = [M80AlertViewDelegate sharedDelegate];
    [[M80AlertViewDelegate sharedDelegate] setBlock:block
                                       forAlertView:self];
    [self show];
}

@end
