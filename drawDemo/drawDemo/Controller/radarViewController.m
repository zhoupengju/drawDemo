//
//  radarViewController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "radarDrawView.h"
#import "radarViewController.h"

@interface radarViewController ()

@end

@implementation radarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    radarDrawView *drawView = [[radarDrawView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:drawView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
