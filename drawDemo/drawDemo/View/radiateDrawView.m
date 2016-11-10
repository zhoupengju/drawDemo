//
//  radiateDrawView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "radiateDrawView.h"

@interface radiateDrawView ()

//添加私有属性
@property (nonatomic, strong) CAAnimationGroup *animationGroup;

@end

@implementation radiateDrawView

//初始化方法
- (id)init {
    self = [super init];
    if (self) {
        
        self.opacity = 0;
        // 配置默认参数
        self.radius = 20;
        self.animationDuration = 3;
        self.pulseInterval = 0;
        
        self.contentsScale = [UIScreen mainScreen].scale;
        self.backgroundColor = PJRandomColor.CGColor;

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            
            [self setupAnimationGroup];
        });
    }
    return self;
}

//radius的setter方法,配置动画启动位置和半径
- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    
    CGPoint tempPos = self.position;
    CGFloat diameter = self.radius * 2;
    self.bounds = CGRectMake(0, 0, diameter, diameter);
    self.cornerRadius = self.radius;
    self.position = tempPos;
}

- (void)setupAnimationGroup {

    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    //配置组合动画CAAnimationGroup
    self.animationGroup = [CAAnimationGroup animation];
    self.animationGroup.duration = self.animationDuration + self.pulseInterval;//每次持续时长
    self.animationGroup.repeatCount = INFINITY;//重复次数
    self.animationGroup.removedOnCompletion = NO;//结束后是否移除
    self.animationGroup.timingFunction = defaultCurve;//时间函数控制动画节奏
    //使用CABasicAnimation控制脉冲的大小
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.0;
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = self.animationDuration;
    
    
    //使用CAKeyframeAnimation来设置透明度渐变
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = self.animationDuration;
    opacityAnimation.values = @[@0.45, @0.45, @0];
    opacityAnimation.keyTimes = @[@0, @0.2, @1];
    opacityAnimation.removedOnCompletion = NO;
    
    NSArray *animations = @[scaleAnimation, opacityAnimation];
    self.animationGroup.animations = animations;
    
    [self addAnimation:self.animationGroup forKey:@"pulse"];
}

@end
