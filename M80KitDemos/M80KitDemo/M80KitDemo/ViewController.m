//
//  ViewController.m
//  M80KitDemo
//
//  Created by amao on 6/20/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

#import "ViewController.h"
#import "M80Kit.h"

@interface TimerObject : NSObject
@end
@implementation TimerObject
- (void)onTimer:(NSTimer *)timer
{
    NSLog(@"....");
}
@end


@interface ViewController ()
@property (nonatomic,strong)    TimerObject *timerObject;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.timerObject = [[TimerObject alloc]init];
	
    M80WeakProxy *proxy = [M80WeakProxy weakProxyForObject:_timerObject];
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:proxy
                                   selector:@selector(onTimer:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onButtonPressed:(id)sender {
    self.timerObject = nil;
}

@end
