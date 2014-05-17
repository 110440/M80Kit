//
//  NSDataTests.m
//  M80Kit
//
//  Created by amao on 5/17/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "M80Kit.h"

@interface NSDataTests : XCTestCase

@end

@implementation NSDataTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBinaryToHex
{
    NSData *data = [NSData dataWithBytes:"m80kit" length:6];
    XCTAssertEqualObjects([data m80BinaryToHex], @"6d38306b6974", @"");
    
    unsigned char bytes[] = {0x11,0x12,0x3f,0x24,0x25};
    XCTAssertEqualObjects([[NSData dataWithBytes:(const void *)bytes length:sizeof(bytes)] m80BinaryToHex], @"11123f2425", @"");
}

@end
