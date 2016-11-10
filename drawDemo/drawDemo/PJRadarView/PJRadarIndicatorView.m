//
//  PJRadarIndicatorView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "PJRadarIndicatorView.h"

@implementation PJRadarIndicatorView

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // 1. 画转动的扇形指示器
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, self.startColor.CGColor);
    CGContextSetLineWidth(ctx, 0);  // 不让显示出来
    
    CGContextMoveToPoint(ctx, self.center.x, self.center.y);
    CGContextAddArc(ctx, self.center.x, self.center.y, self.radius, (self.clockwise?self.angle:0) * M_PI / 180, (self.clockwise?(self.angle -1):1)  * M_PI / 180, self.clockwise);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);  // 绘制路径
    
    const CGFloat *startColorComponents = CGColorGetComponents(self.startColor.CGColor);
    const CGFloat *endColorComponents = CGColorGetComponents(self.endColor.CGColor);
    
    CGFloat R, G, B, A;
    for (int i = 0; i<= self.angle; i++) {
        CGFloat ratio = (self.clockwise?(self.angle -i):i)/self.angle;
        R = startColorComponents[0] - (startColorComponents[0] - endColorComponents[0])*ratio;
        G = startColorComponents[1] - (startColorComponents[1] - endColorComponents[1])*ratio;
        B = startColorComponents[2] - (startColorComponents[2] - endColorComponents[2])*ratio;
        A = startColorComponents[3] - (startColorComponents[3] - endColorComponents[3])*ratio;
        NSLog(@"RGBA: %f, %f, %f, %f", R, G, B, A);
        //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
        UIColor *aColor = [UIColor colorWithRed:R green:G blue:B alpha:A];
        
        CGContextSetFillColorWithColor(ctx, aColor.CGColor);//填充颜色
        CGContextSetLineWidth(ctx, 0);
        CGContextMoveToPoint(ctx, self.center.x, self.center.y);
        CGContextAddArc(ctx, self.center.x, self.center.y, self.radius,  i * M_PI / 180, (i + (self.clockwise?-1:1)) * M_PI / 180, self.clockwise);
        CGContextClosePath(ctx);
        CGContextDrawPath(ctx, kCGPathFillStroke); //绘制路径
    }
}

@end
