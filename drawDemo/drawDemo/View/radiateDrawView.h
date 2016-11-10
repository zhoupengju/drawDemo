//
//  radiateDrawView.h
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface radiateDrawView : CALayer

//雷达扩散最大半径,默认:20pt
@property (nonatomic, assign) CGFloat radius;
// 雷达扩散效果持续时间, 默认:3s
@property (nonatomic, assign) NSTimeInterval animationDuration;
//雷达效果脉冲间隔,默认0秒(一个脉冲消失后,下一个脉冲才出现)
@property (nonatomic, assign) NSTimeInterval pulseInterval; // 默认 is 0s

@end
