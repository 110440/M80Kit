//
//  M80DemoViewController.m
//  M80KitDemo
//
//  Created by amao on 12/18/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import "M80DemoViewController.h"
#import "M80HttpManager.h"

@interface M80DemoViewController ()

@end

@implementation M80DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (NSInteger i = 0; i < 100; i++)
    {
        NSURL *url = [NSURL URLWithString:@"http://www.sina.com"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [[M80HttpManager sharedManager] request:request
                                        success:^(M80HttpOperation *operation, NSData *data) {
                                            NSLog(@"s %@",[operation debugDescription]);
                                        } failure:^(M80HttpOperation *operation, NSError *error) {
                                            NSLog(@"f %@",[operation debugDescription]);
                                        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
