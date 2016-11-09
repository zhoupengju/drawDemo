//
//  radarDrawView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "radarDrawView.h"

/**
 *  核心动画
 
 */

@implementation radarDrawView

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawCicle:rect];
}

- (void)drawCicle:(CGRect)rect {

    // 绘制背景
    [[UIColor orangeColor] setFill];
    UIRectFill(rect);
    
    NSInteger pulsingCount = 5;
    double animationDuration = 3;
    CALayer * animationLayer = [CALayer layer];
    
    for (int i = 0; i < pulsingCount; i++) {
        
        CALayer * pulsingLayer = [CALayer layer];
        
        pulsingLayer.frame = CGRectMake(WIDTH/2.0-100, HEIGHT/2.0-200, 200, 200);
        pulsingLayer.borderColor = [UIColor whiteColor].CGColor;
        pulsingLayer.borderWidth = 1;
        pulsingLayer.cornerRadius = 200 / 2;
        
        CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        
        CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
        animationGroup.fillMode = kCAFillModeBackwards;
        animationGroup.beginTime = CACurrentMediaTime() + (double)i * animationDuration / (double)pulsingCount;
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE;
        animationGroup.timingFunction = defaultCurve;
        
        CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @0.8;
        scaleAnimation.toValue = @1.8;
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
        
        animationGroup.animations = @[scaleAnimation, opacityAnimation];
        [pulsingLayer addAnimation:animationGroup forKey:@"plulsing"];
        [animationLayer addSublayer:pulsingLayer];
    }
    [self.layer addSublayer:animationLayer];
}

//- (void)drawLine {
//    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGContextBeginPath(ctx);
//    
//    CGContextMoveToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 300, 300);
//    CGContextStrokePath(ctx);
//}

@end
