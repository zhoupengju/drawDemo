//
//  PJRadarIndicatorView.h
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PJRadarIndicatorView : UIView

@property (nonatomic, assign) CGFloat radius;           //半径

@property (nonatomic, strong) UIColor *startColor;      //渐变开始颜色

@property (nonatomic, strong) UIColor *endColor;        //渐变结束颜色

@property (nonatomic, assign) CGFloat angle;            //渐变角度

@property (nonatomic, assign) BOOL clockwise;           //是否顺时针

@end
