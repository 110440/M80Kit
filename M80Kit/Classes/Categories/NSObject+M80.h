//
//  NSObject+M80.h
//  M80Kit
//
//  Created by amao on 15/3/30.
//  Copyright (c) 2015年 amao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (M80)
- (NSString *)m80AsString;
- (NSNumber *)m80AsNumber;
- (NSDictionary *)m80AsDictionary;
- (NSArray *)m80AsArray;
- (id)m80AsType:(NSString *)className;
@end
