//
//  FileManagerTests.m
//  M80Kit
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "M80Kit.h"

@interface FileManagerTests : XCTestCase

@end

@implementation FileManagerTests

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

- (void)testSize
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *existsFilepath = [bundle pathForResource:@"test"
                                                ofType:@"txt"];
    
    XCTAssertEqual([[NSFileManager defaultManager] m80FileSize:@"test/file"], 0, @"");
    XCTAssertEqual([[NSFileManager defaultManager] m80FileSize:nil], 0, @"");
    XCTAssertEqual([[NSFileManager defaultManager] m80FileSize:existsFilepath], 16, @"");
}

- (void)testMimeType
{
    
}

- (void)testFileMD5
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *existsFilepath = [bundle pathForResource:@"avatar"
                                                ofType:@"png"];
    
    XCTAssertEqualObjects([[NSFileManager defaultManager] m80MD5:existsFilepath], @"cf3291fbe3d151e582e0727c5fc966cc", @"");
}
@end
