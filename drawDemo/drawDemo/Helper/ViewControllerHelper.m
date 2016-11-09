//
//  ViewControllerHelper.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/8.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "ViewControllerHelper.h"

@implementation ViewControllerHelper

+(NSArray *)dataSource {

    NSMutableArray *arr = [NSMutableArray array];
    ViewControllerModel *model1 = [[ViewControllerModel alloc] init];
    model1.name = @"基本图形";
    model1.destVc = [basicViewController class];
    [arr addObject:model1];
    
    ViewControllerModel *model2 = [[ViewControllerModel alloc] init];
    model2.name = @"下载进度条";
    model2.destVc = [DownLoaderLineController class];
    [arr addObject:model2];
    
    ViewControllerModel *model3 = [[ViewControllerModel alloc] init];
    model3.name = @"流水效果";
    model3.destVc = [WaterFlowViewController class];
    [arr addObject:model3];
    
    ViewControllerModel *model4 = [[ViewControllerModel alloc] init];
    model4.name = @"雷达和类似水波纹效果";
    model4.destVc = [radarViewController class];
    [arr addObject:model4];
    
    ViewControllerModel *model5 = [[ViewControllerModel alloc] init];
    model5.name = @"隐式动画效果";
    model5.destVc = [implicitAnimationController class];
    [arr addObject:model5];
    
    
    return arr.copy;
}

@end
