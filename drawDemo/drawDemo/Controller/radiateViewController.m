//
//  radiateViewController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "radiateDrawView.h"
#import "radiateViewController.h"

@interface radiateViewController ()

@end

@implementation radiateViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(90, 100, 200, 200)];
    [self.view addSubview:bgView];
    
    
    for (int i = 0; i<= 100; i++) {
    
        radiateDrawView *animationlayer = [radiateDrawView layer];
        animationlayer.position = CGPointMake(arc4random_uniform(260),arc4random_uniform(400)) ;
        [bgView.layer insertSublayer:animationlayer below:bgView.layer];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
