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

#define angle2Radian(angel) ((angel) / 180.0 * M_PI)

@interface implicitAnimationController ()

@property (nonatomic, strong) CALayer *layer;

@property (nonatomic, weak) UIView *customView;

@end

@implementation implicitAnimationController

#pragma mark - 图标抖动动画
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animation];
    keyAnim.keyPath = @"transform.rotation";
    keyAnim.values = @[@(-angle2Radian(10)), @(angle2Radian(10)), @(-angle2Radian(10))];
    
    keyAnim.removedOnCompletion = NO;
    keyAnim.fillMode = kCAFillModeForwards;
    keyAnim.duration = 0.2;
    
    keyAnim.repeatCount = MAXFLOAT;
    
    [self.customView.layer addAnimation:keyAnim forKey:nil];
}

#pragma mark - 动画
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *labelnfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    [self.view addSubview:labelnfo];
    
    labelnfo.numberOfLines = 2;
    labelnfo.textColor = [UIColor orangeColor];
    labelnfo.textAlignment = NSTextAlignmentCenter;
    labelnfo.text = @"可以打开或者屏蔽代码, 显示不同的动画效果";
    
    UILabel *labelnfoClick = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, WIDTH, 30)];
    [self.view addSubview:labelnfoClick];

    labelnfoClick.textColor = [UIColor redColor];
    labelnfoClick.textAlignment = NSTextAlignmentCenter;
    labelnfoClick.text = @"请点击屏幕";
    
    // 创建layer
    UIImageView *customView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 130)];
    self.customView = customView;
    [self.view addSubview:customView];

    customView.center = CGPointMake(WIDTH/2.0, 150);
    customView.image = [UIImage imageNamed:@"222"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationWillStartSelector:@selector(kkkkkkkk)];
//    [UIView setAnimationDidStopSelector:@selector(haahhah)];
//    self.customView.center = CGPointMake(300, 500);
//    
//    [UIView commitAnimations];
//    
////    self.customView.center = CGPointMake(80, 80);
//}

- (void)kkkkkkkk {

    NSLog(@"touchesBegan");
}

- (void)haahhah {

    NSLog(@"touchesEnd");
}

#pragma mark - 组动画
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    // 创建layer
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 330, 350)];
//    self.customView = customView;
//    [self.view addSubview:customView];
//    
//    customView.center = CGPointMake(WIDTH/2.0, 200);
//    customView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
//}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    CABasicAnimation *caAni1 = [CABasicAnimation animation];
//    caAni1.keyPath = @"transform.translation.y";
//    caAni1.toValue = @(300);
//    
//    CABasicAnimation *caAni2 = [CABasicAnimation animation];
//    caAni2.keyPath = @"transform.scale";
//    caAni2.toValue = @(0.0);
//    
//    CABasicAnimation *caAni3 = [CABasicAnimation animation];
//    caAni3.keyPath = @"transform.rotation";
//    caAni3.toValue = @(2*M_PI);
//
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    
//    group.animations = @[caAni1, caAni2, caAni3];
//    group.duration = 3;
//    
//    [self.customView.layer addAnimation:group forKey:nil];
//}

#pragma mark - 转场动画
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    // 创建layer
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 330, 350)];
//    self.customView = customView;
//    [self.view addSubview:customView];
//    
//    customView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
//    customView.center = CGPointMake(WIDTH/2.0, HEIGHT/3.0);
//}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    // Core Animation是直接作用在CALayer上的.
//    CATransition *traAnima = [CATransition animation];
//    
////    NSString * const kCATransitionFade;
////    NSString * const kCATransitionMoveIn;
////    NSString * const kCATransitionPush;
////    NSString * const kCATransitionReveal;
//    traAnima.type = @"cube";
////    traAnima.type = @"rippleEffect";
//    traAnima.subtype = kCATransitionFromLeft; // 设置方向
////    traAnima.startProgress = 0.5; // 从什么地方开始动画
//    traAnima.endProgress = 0.5;
//    
//    traAnima.duration = 3;
//    
//    [self.customView.layer addAnimation:traAnima forKey:@"yueyue"];
//}


#pragma mark - 关键帧动画
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    // 创建layer
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//    self.customView = customView;
//    [self.view addSubview:customView];
//    
//    customView.center = CGPointMake(50, 50);
//    
//    customView.backgroundColor = [UIColor redColor];
//    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 175, 40)];
//    [self.view addSubview:btn];
//    btn.backgroundColor = [UIColor redColor];
//    
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    // Core Animation是直接作用在CALayer上的.
//    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
//    
//    keyAnima.keyPath = @"position";
//    keyAnima.duration = 5;
//
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));
//    
//    keyAnima.path = path;
//    CGPathRelease(path);
//    
//    // 观察动画什么时候开始执行, 以及时候执行完毕.
//    keyAnima.delegate = self;
//    
//    keyAnima.removedOnCompletion = NO;
//    keyAnima.fillMode = kCAFillModeForwards;
//    
//    [self.customView.layer addAnimation:keyAnima forKey:@"yueyue"];
//}

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

// 把文字和图片绘制到一起
- (void)picture {

    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    [self.view addSubview:imageView];
    //    imageView.backgroundColor = [UIColor whiteColor];
    //
    //    // 创建一个bitmap的上下文
    //    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), YES, 0);
    //
    //    // 获取bitmap上下文
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    //    // 绘图
    ////    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 50, 50));
    ////
    ////    // 渲染
    ////    CGContextStrokePath(context);
    //
    //    CGContextFillRect(context, CGRectMake(0, 0, 50, 50));
    //
    //    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    imageView.image = image;
    //
    //    NSData *data = UIImageJPEGRepresentation(image, 1);
    //    [data writeToFile:@"" atomically:YES];
    
    //    UIImage *image = [UIImage imageNamed:@"2.jpg"];
    //    UIGraphicsBeginImageContextWithOptions(image.size, YES, 0);
    //    [image drawAtPoint:CGPointMake(0, 0)];
    //    UIImage *image1 = [UIImage imageNamed:@"vip_ic_reason_1"];
    //    [image1 drawAtPoint:CGPointMake(200, 200)];
    //    NSString *str = @"我是超人";
    //    [str drawAtPoint:CGPointMake(120, 120) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    //    UIImage *image11 = UIGraphicsGetImageFromCurrentImageContext();
    //        UIGraphicsEndImageContext();
    //    NSData *data = UIImageJPEGRepresentation(image11, 1);
    //    [data writeToFile:@"/Users/zhoupengju/Desktop/test@.png" atomically:YES];
}

@end
