//
//  facebookPopController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "facebookPopController.h"

@interface facebookPopController ()

@end

@implementation facebookPopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    // https://github.com/facebook/pop
    
    UILabel *labelnfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    [self.view addSubview:labelnfo];

    labelnfo.numberOfLines = 2;
    labelnfo.textColor = [UIColor orangeColor];
    labelnfo.textAlignment = NSTextAlignmentCenter;
    labelnfo.text = @"正在开发中... 敬请期待!";
}

@end
