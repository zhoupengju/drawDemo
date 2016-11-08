//
//  Quartz2DDraw.m
//  drawDemo
//
//  Created by hetane on 16/11/7.
//  Copyright © 2016年 hetane. All rights reserved.
//

#import "Quartz2DDraw.h"


#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

@implementation Quartz2DDraw

-(void)drawRect:(CGRect)rect {
    
    [self drawLine];
}

- (void)drawLine {

    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
//    
//    [bezierPath moveToPoint:CGPointMake(60, 200)];
//    
//    [bezierPath addLineToPoint:CGPointMake(WIDTH-60, 200)];
//    
//    CGContextSetLineWidth(ctx, 30);
//    CGContextSetLineCap(ctx, kCGLineCapRound);
//    
//    [[UIColor orangeColor] set];
//    
//    CGContextAddPath(ctx, bezierPath.CGPath);
//    
//    CGContextStrokePath(ctx);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextStrokePath(ctx);
    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
//    CGContextMoveToPoint(context, 20, 120);
//    CGContextAddLineToPoint(context, 200,20);
//    CGContextStrokePath(context);
    
//    CGContextStrokePath(context);
}

@end
