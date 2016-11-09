//
//  implicitAnimationView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "implicitAnimationView.h"

@implementation implicitAnimationView

- (void)drawRect:(CGRect)rect {
    
    // 渲染是渲染到layer上
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    
    // 这个地方其实是调用了 [self.layer drawInContext:ctx] 方法.
    // 渲染其实就是渲染到view的根layer上面去的.
    CGContextFillPath(ctx);
    
}

@end
