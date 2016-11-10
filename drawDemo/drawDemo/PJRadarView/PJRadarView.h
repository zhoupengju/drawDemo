//
//  PJRadarView.h
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJRadarPointView.h"
#import "PJRadarIndicatorView.h"

@class PJRadarView;

@protocol PJRadarViewDataSource <NSObject>

@optional

- (NSInteger)numberOfSectionsInRadarView:(PJRadarView *)radarView;

- (NSInteger)numberOfPointsInRadarView:(PJRadarView *)radarView;

// 点击到的星星
- (UIView *)radarView:(PJRadarView *)radarView pointForIndex:(NSUInteger)index;

- (CGPoint)radarView:(PJRadarView *)radarView pointPositionForIndex:(NSUInteger)index;

@end

@protocol PJRadarViewDelegate <NSObject>

@optional

- (void)radarView:(PJRadarView *)radarView didSelectItemAtIndex:(NSUInteger)index; //点击事件

@end

@interface PJRadarView : UIView <PJRadarPointViewDelegate>

@property (nonatomic, assign) CGFloat radius;   //半径

@property (nonatomic, strong) UIColor *indicatorStartColor;      //渐变开始颜色
@property (nonatomic, strong) UIColor *indicatorEndColor;        //渐变结束颜色
@property (nonatomic, assign) CGFloat indicatorAngle;            //指针渐变角度
@property (nonatomic, assign) BOOL indicatorClockwise;           //是否顺时针

@property (nonatomic, strong) UIImage *backgroundImage; //背景图片

@property (nonatomic, strong) UILabel *textLabel;      //提示标签

@property (nonatomic, strong) NSString *labelText;      //提示文字

@property (nonatomic, strong) UIView *pointsView;       //目标点视图

@property (nonatomic, strong) PJRadarIndicatorView *indicatorView;      //指针

@property (nonatomic, assign) id <PJRadarViewDelegate> delegate;        //委托
@property (nonatomic, assign) id <PJRadarViewDataSource> dataSource;    //数据源

-(void)scan;    //扫描
-(void)stop;    //停止
-(void)show;    //显示目标
-(void)hide;    //隐藏目标

@end
