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
    
    return arr.copy;
}

@end
