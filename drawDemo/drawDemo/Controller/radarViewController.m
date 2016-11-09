//
//  radarViewController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "Quartz2DDraw.h"
#import "radarViewController.h"

@interface radarViewController ()

@end

@implementation radarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Quartz2DDraw *drawView = [[Quartz2DDraw alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:drawView];
    
    drawView.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
