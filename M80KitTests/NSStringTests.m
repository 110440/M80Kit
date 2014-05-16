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
    NSString *emptyString = @"";
    NSString *normalString = @"m80kit";
    
    XCTAssertEqualObjects([nilString m80MD5], nil, @"");
    XCTAssertEqualObjects([emptyString m80MD5], @"d41d8cd98f00b204e9800998ecf8427e", @"");
    XCTAssertEqualObjects([normalString m80MD5], @"b4791097a8a711121d7a6669e322a87f", @"");
    
}

@end
