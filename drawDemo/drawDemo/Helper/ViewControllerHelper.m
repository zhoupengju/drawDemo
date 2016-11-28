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
    
    ViewControllerModel *model5 = [[ViewControllerModel alloc] init];
    model5.name = @"隐式动画效果";
    model5.destVc = [implicitAnimationController class];
    [arr addObject:model5];
    
    ViewControllerModel *model2 = [[ViewControllerModel alloc] init];
    model2.name = @"下载进度条";
    model2.destVc = [DownLoaderLineController class];
    [arr addObject:model2];
    
    ViewControllerModel *model3 = [[ViewControllerModel alloc] init];
    model3.name = @"流水效果";
    model3.destVc = [WaterFlowViewController class];
    [arr addObject:model3];
    
    ViewControllerModel *model9 = [[ViewControllerModel alloc] init];
    model9.name = @"双波浪效果";
    model9.destVc = [WaterFlowDoubleController class];
    [arr addObject:model9];
    
    ViewControllerModel *model4 = [[ViewControllerModel alloc] init];
    model4.name = @"雷达放射效果";
    model4.destVc = [radiateViewController class];
    [arr addObject:model4];
    
    ViewControllerModel *model6 = [[ViewControllerModel alloc] init];
    model6.name = @"雷达扩散效果";
    model6.destVc = [radarViewController class];
    [arr addObject:model6];
    
    ViewControllerModel *model7 = [[ViewControllerModel alloc] init];
    model7.name = @"雷达扫描效果";
    model7.destVc = [radarScanViewController class];
    [arr addObject:model7];
    
    ViewControllerModel *model8 = [[ViewControllerModel alloc] init];
    model8.name = @"测试POP框架: https://github.com/facebook/pop. 正在测试中";
    model8.destVc = [facebookPopController class];
    [arr addObject:model8];
    
    return arr.copy;
}

@end
