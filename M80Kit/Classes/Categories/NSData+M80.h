//
//  NSData+M80.h
//  M80Kit
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (M80)
- (NSString *)m80BinaryToHex;

- (NSString *)m80MD5;
@end


@interface NSData  (M80Crypto)
- (NSData *)m80AES128Encrypt:(NSString *)key;
- (NSData *)m80AES192Encrypt:(NSString *)key;
- (NSData *)m80AES256Encrypt:(NSString *)key;
- (NSData *)m80DESEncrypt:(NSString *)key;
- (NSData *)m803DESEncrypt:(NSString *)key;
- (NSData *)m80RC4Encrypt:(NSString *)key;



- (NSData *)m80AES128Decrypt:(NSString *)key;
- (NSData *)m80AES192Decrypt:(NSString *)key;
- (NSData *)m80AES256Decrypt:(NSString *)key;
- (NSData *)m80DESDecrypt:(NSString *)key;
- (NSData *)m803DESDecrypt:(NSString *)key;
- (NSData *)m80RC4Decrypt:(NSString *)key;
@end