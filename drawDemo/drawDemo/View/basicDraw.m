//
//  basicDraw.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/8.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "basicDraw.h"



@implementation basicDraw

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawLine];
    
    [self drawLine1];
    
    [self drawDottedLine];
    
    [self drawSina];
    
    [self drawsQuareLine1];
    
    [self drawsQuareLine2];
    
    [self drawsQuareLine23];
    
    [self drawsQuareLine3];
    
    [self drawsQuareLine4];
}

- (void)drawsQuareLine4 {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 5.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGRect rectangle = CGRectMake(60,380,222,80);
    CGContextAddRect(ctx, rectangle);
    CGContextStrokePath(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, rectangle);
    
    CGContextStrokePath(ctx);
}

- (void)drawsQuareLine3 {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 3);
    [[UIColor cyanColor] set];
    
    CGRect rectangle = CGRectMake(20, 300, WIDTH-40, 60);
    CGContextAddEllipseInRect(ctx, rectangle);
    
    CGContextStrokePath(ctx);
}

- (void)drawsQuareLine23 {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 8.0);
    CGContextSetStrokeColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextMoveToPoint(context, 180, 180);
    CGContextAddLineToPoint(context, 230, 230);
    CGContextAddLineToPoint(context, 180, 280);
    CGContextAddLineToPoint(context, 130, 230);
    CGContextAddLineToPoint(context, 180, 180);
    CGContextStrokePath(context);
    
    CGContextStrokePath(context);
}

- (void)drawsQuareLine2 {
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    
    CGPoint center1 = CGPointMake(260, 140);
    CGFloat radius1 = 50;
    
    CGFloat startAngle1 = -M_PI_4;
    CGFloat endAngle1 = ((float)M_PI*2)-startAngle1 ;
    
    [bezierPath1 addArcWithCenter:center1 radius:radius1 startAngle:startAngle1 endAngle:endAngle1 clockwise:YES];
    
    CGContextSetLineWidth(ctx1, 5);
    CGContextSetLineCap(ctx1, kCGLineCapRound);
    [[UIColor redColor] set];
    
    CGContextAddPath(ctx1, bezierPath1.CGPath);
    
    CGContextFillPath(ctx1);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    CGPoint center = CGPointMake(260, 140);
    CGFloat radius = 50;
    
    CGFloat startAngle = -((float)M_PI)/7;
    CGFloat endAngle = ((float)M_PI)-startAngle ;
    
    [bezierPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor orangeColor] set];
    
    CGContextAddPath(ctx, bezierPath.CGPath);
    
    CGContextStrokePath(ctx);
}

- (void)drawsQuareLine1 {

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 3);
    CGContextSetRGBStrokeColor(ctx, 200/255.0, 4/255.0, 0, 1);
    [[UIColor greenColor] set];
    CGContextFillRect(ctx, CGRectMake(30, 95, 100, 100));
    
    CGContextStrokePath(ctx);
}

- (void)drawDottedLine {

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //    [shapeLayer setBounds:self.bounds];
    //    [shapeLayer setPosition:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:[UIColor magentaColor].CGColor];
    [shapeLayer setLineWidth:5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //设置虚线的线宽及间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:10], [NSNumber numberWithInt:10], nil]];
    [shapeLayer setLineCap:@"round"];
    CGMutablePathRef path = CGPathCreateMutable();

    CGPathMoveToPoint(path, NULL, 20, 80);
    CGPathAddLineToPoint(path, NULL, WIDTH-20, 80);

    [shapeLayer setPath:path];
    CGPathRelease(path);

    [self.layer addSublayer:shapeLayer];
}

// 这种方式绘制虚线有问题 - 在他后面绘制的图形全部会变成虚线.
//- (void)drawDottedLine {
//    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGContextMoveToPoint(ctx, 10, 90);
//    CGContextAddLineToPoint(ctx, WIDTH-10, 90);
//    
//    CGContextSetLineWidth(ctx, 5);
//    CGContextSetLineCap(ctx, kCGLineCapRound);
//    //    [[UIColor orangeColor] set];
//    CGContextSetRGBStrokeColor(ctx, 200/255.0, 0/255.0, 200/255.0, 1);
//    
//    CGFloat arr[] = {5,10};
//    //下面最后一个参数“2”代表排列的个数。
//    CGContextSetLineDash(ctx, 0, arr, 2);
//    //CGContextDrawPath(currentContext, kCGPathStroke);
//    CGContextStrokePath(ctx);
//}

- (void)drawSina {

    // 1. 绘制直线
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx1, 30, 550);
    CGContextAddLineToPoint(ctx1, WIDTH-30, 550);
    
    CGContextSetLineWidth(ctx1, 5);
    [[UIColor greenColor] set];
    
    CGContextStrokePath(ctx1);
    
    // 2. 绘制曲线
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(30, 550)];
    [bezierPath addCurveToPoint:CGPointMake(WIDTH-30, 550) controlPoint1:CGPointMake(WIDTH/2.0, 400) controlPoint2:CGPointMake(WIDTH/2.0, 700)];
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor orangeColor] set];
    
    CGContextAddPath(ctx, bezierPath.CGPath);
    
    CGContextStrokePath(ctx);
}

- (void)drawLine1 {

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(20, 60)];
    
    [bezierPath addLineToPoint:CGPointMake(WIDTH-20, 60)];
    
    CGContextSetLineWidth(ctx, 20);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    [[UIColor orangeColor] set];
    
    CGContextAddPath(ctx, bezierPath.CGPath);
    
    CGContextStrokePath(ctx);
}

- (void)drawLine {

    // 画条线
    [@"画条线" drawInRect:CGRectMake(WIDTH/2.0 - 40, 10, 100, 20) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0], NSForegroundColorAttributeName : PJColor(200, 0, 200)}];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 10, 40);
    CGContextAddLineToPoint(ctx, WIDTH-10, 40);
    
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //    [[UIColor orangeColor] set];
    CGContextSetRGBStrokeColor(ctx, 200/255.0, 0/255.0, 200/255.0, 1);
    
    CGContextStrokePath(ctx);
}

@end
