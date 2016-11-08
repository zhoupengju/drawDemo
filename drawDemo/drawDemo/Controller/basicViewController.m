//
//  basicViewController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/8.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "basicDraw.h"
#import "basicViewController.h"

@interface basicViewController ()

@end

@implementation basicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    basicDraw *draw = [[basicDraw alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:draw];
    
    draw.backgroundColor = [UIColor whiteColor];

    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
