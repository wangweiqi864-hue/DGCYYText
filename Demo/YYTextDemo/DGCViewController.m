//
//  DGCViewController.m
//  DGCYYTextDemo
//
//  Created by ibireme on 15/10/17.
//  Copyright © 2015年 ibireme. All rights reserved.
//

#import "DGCViewController.h"
#import "DGCYYTextExample.h"
@interface DGCViewController ()

@end

@implementation DGCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DGCYYTextExample *vc = [DGCYYTextExample new];
    [self pushViewController:vc animated:NO];
}



@end
