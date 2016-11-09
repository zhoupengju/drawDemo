//
//  implicitAnimationController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "implicitAnimationView.h"
#import "implicitAnimationLayer.h"
#import "implicitAnimationController.h"

/**
    CALayer
    CALayer有两个非常重要的属性: position和anchorPoint
 
     position设置CALayer在父视图中的位置, 相当于UIView中的center
     
     anchorPoint称为锚点, 决定CALayer身上的哪个点会在position属性所指的位置, 默认为(0.5, 0.5)
 
    隐式动画
     * 每一个UIView内部都默认关联着一个CALayer, 我们可以称这个为Root Layer, 他没有隐式动画
     
     * 所有的非Root Layer, 也就是手动创建的CALayer对象, 都存在着隐式动画
     
     * 什么是隐式动画
     1. 对非Root Layer的部分属性进行修改时, 默认会产生一些动画效果, 这些效果称为Animatable Properties(可动画属性)
     2. 设置bounds, backgroundColor, position都能引起动画
 */

@interface implicitAnimationController ()

@property (nonatomic, strong) CALayer *layer;

@property (nonatomic, weak) UIView *customView;

@end

@implementation implicitAnimationController

#pragma mark - 转场动画

#pragma mark - 关键帧动画
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // 创建layer
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.customView = customView;
    [self.view addSubview:customView];
    
    customView.center = CGPointMake(50, 50);
    
    customView.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 175, 40)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     
    // Core Animation是直接作用在CALayer上的.
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    
    keyAnima.keyPath = @"position";
    keyAnima.duration = 5;

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));
    
    keyAnima.path = path;
    CGPathRelease(path);
    
    // 观察动画什么时候开始执行, 以及时候执行完毕.
    keyAnima.delegate = self;
    
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    
    [self.customView.layer addAnimation:keyAnima forKey:@"yueyue"];
}

- (void)btnClick {

    [self.customView.layer removeAnimationForKey:@"yueyue"];
}

- (void)test {

    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    
    keyAnima.keyPath = @"position";
    keyAnima.duration = 5;
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(300, 50)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(50, 300)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    
    keyAnima.values = @[v1, v2, v3, v4, v5];
    //    keyAnima.keyTimes = @[@(1.1), @(0.3), @(0.2), @(1.2), @(2.2)];
    
    // 设置速度
    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // 观察动画什么时候开始执行, 以及时候执行完毕.
    keyAnima.delegate = self;
    
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    
    [self.customView.layer addAnimation:keyAnima forKey:nil];
}

-(void)animationDidStart:(CAAnimation *)anim {

    NSLog(@"animationDidStart");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    NSLog(@"animationDidStop");
}

#pragma mark - 基本动画
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    // 创建layer
//    CALayer *layer = [[CALayer alloc] init];
//    self.layer = layer;
//    [self.view.layer addSublayer:layer];
//    
//    layer.backgroundColor = [UIColor orangeColor].CGColor;
//    layer.bounds = CGRectMake(0, 0, 100, 100);
//    layer.anchorPoint = CGPointMake(0, 0);
//    layer.position = CGPointMake(100, 100);
//    
//}

// 4. 缩放
- (void)testScale {

    CABasicAnimation *anima = [CABasicAnimation animation];
    
    anima.duration = 1;
    
    //    anima.keyPath = @"transform";
    //    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 1, 100)];
    
    //    anima.keyPath = @"transform.translation.y";
    //    anima.toValue = @(100);
    
    anima.keyPath = @"transform.scale";
    anima.toValue = @(1.5);
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:anima forKey:nil];
}

// 3. 平移, 旋转
- (void)testTransform {

    CABasicAnimation *anima = [CABasicAnimation animation];
    
    anima.duration = 1;
    anima.keyPath = @"transform";
    
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 1, 0)];
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:anima forKey:nil];
}

// 2. 缩放
- (void)testBounds {

    CABasicAnimation *anima = [CABasicAnimation animation];
    
    anima.keyPath = @"bounds";
    
    anima.duration = 1;
    
    anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:anima forKey:nil];
}

// 1. 平移
- (void)testPosition {

    CABasicAnimation *anima = [CABasicAnimation animation];
    
    anima.keyPath = @"position";
    //    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    //    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)]; // 移动到哪里
    anima.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];   // 在之前基础上增加多少
    
    anima.duration = 1; // 设置动画的时间
    
    // 设置动画执行完之后不删除, 保存动画的最新状态
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;   // 此模式, 动画不会自动回去
    
    [self.layer addAnimation:anima forKey:nil];
}

- (void)drawGraphAnimation {

    CALayer *layer = [[CALayer alloc] init];
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.zPosition = 0.0;
}

// 隐式动画
- (void)testImplicitAnimation {

    // 第一种, 继承layer, 自定义layer
    //    implicitAnimationLayer *layer = [implicitAnimationLayer layer];
    //    [self.view.layer addSublayer:layer];
    //
    //    layer.bounds = CGRectMake(0, 0, 100, 100);
    //    layer.anchorPoint = CGPointMake(0, 0);
    //    layer.backgroundColor = [UIColor greenColor].CGColor;
    //
    //    [layer setNeedsDisplay];
    
    
    // 2. 通过代理自定义layer
    CALayer *layer = [[CALayer alloc] init];
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.zPosition = 0.0;
    
    layer.delegate = self;
    
    [layer setNeedsDisplay];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {

    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    self.layer.position = CGPointMake(75, 200);
//    self.layer.bounds = CGRectMake(0, 0, 200, 250);
//    self.layer.zPosition = 100.0;
//}

@end
