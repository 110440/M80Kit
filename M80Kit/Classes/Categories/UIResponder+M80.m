//
//  UIResponder+M80.m
//  M80Kit
//
//  Created by amao on 2/28/15.
//  Copyright (c) 2015 amao. All rights reserved.
//

#import "UIResponder+M80.h"
#import "M80Config.h"

@implementation UIResponder (M80)
- (void)m80Router:(id)data
{
    M80Log(@"router %@",self);
    [[self nextResponder] m80Router:data];
}
@end
