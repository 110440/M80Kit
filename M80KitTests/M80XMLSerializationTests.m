//
//  M80XMLSerializationTests.m
//  M80Kit
//
//  Created by amao on 9/22/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "M80Kit.h"

@interface M80XMLSerializationTests : XCTestCase

@end

@implementation M80XMLSerializationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParse
{
    NSString *filepath = [[NSBundle bundleForClass:[self class]] pathForResource:@"emoji"
                                                                          ofType:@"xml"];
    NSDictionary *dict = [M80XMLSerialization xmlObjectWithData:[NSData dataWithContentsOfFile:filepath]
                                                        options:M80XMLOptionsProcessNamespaces
                                                          error:nil];
    NSLog(@"%@",dict);
}

@end
