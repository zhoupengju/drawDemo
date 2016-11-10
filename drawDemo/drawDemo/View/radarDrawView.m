//
//  radarDrawView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "radarDrawView.h"

#define pulsingCount 5
#define animationDuration 3

@implementation radarDrawView

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawCicle:rect];
}

- (void)drawCicle:(CGRect)rect {

    // 绘制背景
    [[UIColor orangeColor] setFill];
    UIRectFill(rect);
    
    CALayer * animationLayer = [CALayer layer];
    
    for (int i = 0; i < pulsingCount; i++) {
        
        // 1. 创建layer, 用于添加隐式动画
        CALayer * pulsingLayer = [CALayer layer];

        pulsingLayer.frame = CGRectMake(WIDTH/2.0-100, HEIGHT/4.0, 200, 200);
        pulsingLayer.borderColor = [UIColor whiteColor].CGColor;
        pulsingLayer.borderWidth = 1;
        pulsingLayer.cornerRadius = 200 / 2;
        
        // 2. 设置放大效果动画
        CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @0.8;
        scaleAnimation.toValue = @1.8;
        
        // 4. 设置关键帧动画
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animation];
        opacityAnimation.keyPath = @"opacity";  // 透明动画
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];

        // 4. 设置组动画
        CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
        animationGroup.fillMode = kCAFillModeBackwards;
        animationGroup.beginTime = CACurrentMediaTime() + (double)i * animationDuration / (double)pulsingCount;
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE;
        animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        animationGroup.animations = @[scaleAnimation, opacityAnimation];
        
        // 5. 把设置好的动画添加到layer上
        [pulsingLayer addAnimation:animationGroup forKey:@"plulsing"];  // 只是做一个标记
        [animationLayer addSublayer:pulsingLayer];
    }
    
    [self.layer addSublayer:animationLayer];
}

@end
