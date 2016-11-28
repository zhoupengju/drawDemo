//
//  WaterFlowDoubleController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/28.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "HT_WaterDoubleView.h"
#import "WaterFlowDoubleController.h"

@interface WaterFlowDoubleController ()

@property (nonatomic, strong) HT_WaterDoubleView *headerView;

@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation WaterFlowDoubleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.headerView];
}

- (UIImageView *)iconImageView{
    
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.headerView.frame.size.width/2-30, 0, 50, 50)];
        _iconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _iconImageView.layer.borderWidth = 2;
        _iconImageView.layer.cornerRadius = 25;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.image = [UIImage imageNamed:@"222"];
    }
    return _iconImageView;
}

- (HT_WaterDoubleView *)headerView{
    
    if (!_headerView) {
        _headerView = [[HT_WaterDoubleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _headerView.backgroundColor = PJColorRGBA(248, 64, 87, 1);
        [_headerView addSubview:self.iconImageView];
        __weak typeof(self)weakSelf = self;
        _headerView.waveBlock = ^(CGFloat currentY){
            CGRect iconFrame = [weakSelf.iconImageView frame];
            iconFrame.origin.y = CGRectGetHeight(weakSelf.headerView.frame)-CGRectGetHeight(weakSelf.iconImageView.frame)+currentY-weakSelf.headerView.waveHeight;
            weakSelf.iconImageView.frame  =iconFrame;
        };
        [_headerView startWaveAnimation];
    }
    return _headerView;
}

@end
