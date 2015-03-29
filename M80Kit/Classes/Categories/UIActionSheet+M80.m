//
//  UIActionSheet+M80.m
//  M80Kit
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import "UIActionSheet+M80.h"
#import <objc/runtime.h>

@interface M80ActionSheetDelegate : NSObject<UIActionSheetDelegate>
@property (nonatomic,strong)    NSMutableDictionary *dict;
@end

@implementation M80ActionSheetDelegate
+ (instancetype)sharedDelegate
{
    static M80ActionSheetDelegate *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[M80ActionSheetDelegate alloc] init];
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

- (void)setBlock:(M80UIActionSheetBlock)block
  forActionSheet:(UIActionSheet *)actionSheet
{
    NSString *description = [actionSheet description];
    if (block && description)
    {
        [_dict setObject:[block copy]
                  forKey:description];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *description = [actionSheet description];
    M80UIActionSheetBlock block = [_dict objectForKey:description];
    if (block)
    {
        block(buttonIndex);
        [_dict removeObjectForKey:description];
    }
}

@end
@implementation UIActionSheet (M80)

- (void)m80ShowInView:(UIView *)view
    completionHandler:(M80UIActionSheetBlock)block
{
    self.delegate = [M80ActionSheetDelegate sharedDelegate];
    [[M80ActionSheetDelegate sharedDelegate] setBlock:block
                                       forActionSheet:self];
    [self showInView:view];
}



@end
