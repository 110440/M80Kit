//
//  NSStringTests.m
//  M80Kit
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "M80Kit.h"

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

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

- (void)testMD5
{
    NSString *nilString = nil;
    XCTAssertEqualObjects([nilString m80MD5], nil, @"");
    XCTAssertEqualObjects([@"" m80MD5], @"d41d8cd98f00b204e9800998ecf8427e", @"");
    XCTAssertEqualObjects([@"m80kit" m80MD5], @"b4791097a8a711121d7a6669e322a87f", @"");

}

- (void)testTrim
{
    XCTAssertEqualObjects([@"  m80kit" m80Trim], @"m80kit", @"");
    XCTAssertEqualObjects([@"m80kit  " m80Trim],@"m80kit", @"");
    XCTAssertEqualObjects([@" m80kit \n" m80Trim], @"m80kit", @"");
}

- (void)testGBKBytesLength
{
    XCTAssertEqual([@"m80kit" m80GBKBytesLength], 6, @"");
    XCTAssertEqual([@"m80基础库" m80GBKBytesLength], 9, @"");
}

- (void)testURLEncoding
{
    XCTAssertEqualObjects([@"http://www.163.com" m80StringByURLEncoding], @"http%3A%2F%2Fwww.163.com", @"");
    XCTAssertEqualObjects([@"http://weibo.com/epmao/home?wvr=5" m80StringByURLEncoding], @"http%3A%2F%2Fweibo.com%2Fepmao%2Fhome%3Fwvr%3D5", @"");
}

@end
