
//
//  WaterFlowViewController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/8.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "HT_WaterView.h"
#import "WaterFlowViewController.h"

@interface WaterFlowViewController ()

@end

@implementation WaterFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HT_WaterView *waterView = [[HT_WaterView alloc] initWithFrame:CGRectMake(0, 350, WIDTH, 30)];
    [self.view addSubview:waterView];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"meNavbg02"]];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
