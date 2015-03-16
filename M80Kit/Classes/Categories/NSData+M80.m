//
//  NSData+M80.m
//  M80Kit
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import "NSData+M80.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

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

- (NSString *)m80MD5
{
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (CC_LONG)[self length], r);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
}
@end



@implementation NSData (M80Crypto)

- (NSData *)m80AES128Encrypt:(NSString *)key
{
    return [self crypt:kCCEncrypt
             algorithm:kCCAlgorithmAES
               keySize:kCCKeySizeAES128
                   key:key];
}
- (NSData *)m80AES192Encrypt:(NSString *)key
{
    return [self crypt:kCCEncrypt
             algorithm:kCCAlgorithmAES
               keySize:kCCKeySizeAES192
                   key:key];
}
- (NSData *)m80AES256Encrypt:(NSString *)key
{
    return [self crypt:kCCEncrypt
             algorithm:kCCAlgorithmAES
               keySize:kCCKeySizeAES256
                   key:key];
}
- (NSData *)m80DESEncrypt:(NSString *)key
{
    return [self crypt:kCCEncrypt
             algorithm:kCCAlgorithmDES
               keySize:kCCKeySizeDES
                   key:key];
}
- (NSData *)m803DESEncrypt:(NSString *)key
{
    return [self crypt:kCCEncrypt
             algorithm:kCCAlgorithm3DES
               keySize:kCCKeySize3DES
                   key:key];
}
- (NSData *)m80RC4Encrypt:(NSString *)key
{
    return [self crypt:kCCEncrypt
             algorithm:kCCAlgorithmRC4
               keySize:kCCKeySizeMaxRC4
                   key:key];
}



- (NSData *)m80AES128Decrypt:(NSString *)key
{
    return [self crypt:kCCDecrypt
             algorithm:kCCAlgorithmAES
               keySize:kCCKeySizeAES128
                   key:key];

}
- (NSData *)m80AES192Decrypt:(NSString *)key
{
    return [self crypt:kCCDecrypt
             algorithm:kCCAlgorithmAES
               keySize:kCCKeySizeAES192
                   key:key];

}
- (NSData *)m80AES256Decrypt:(NSString *)key
{
    return [self crypt:kCCDecrypt
             algorithm:kCCAlgorithmAES
               keySize:kCCKeySizeAES256
                   key:key];
}
- (NSData *)m80DESDecrypt:(NSString *)key
{
    return [self crypt:kCCDecrypt
             algorithm:kCCAlgorithmDES
               keySize:kCCKeySizeDES
                   key:key];
}
- (NSData *)m803DESDecrypt:(NSString *)key
{
    return [self crypt:kCCDecrypt
             algorithm:kCCAlgorithm3DES
               keySize:kCCKeySize3DES
                   key:key];
}
- (NSData *)m80RC4Decrypt:(NSString *)key
{
    return [self crypt:kCCDecrypt
             algorithm:kCCAlgorithmRC4
               keySize:kCCKeySizeMaxRC4
                   key:key];
}


- (NSData *)crypt:(CCOperation)operation
        algorithm:(CCAlgorithm)algorithm
          keySize:(NSInteger)keySize
              key:(NSString *)key
{
    return nil;
}


@end