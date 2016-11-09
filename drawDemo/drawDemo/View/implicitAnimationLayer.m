//
//  implicitAnimationLayer.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "implicitAnimationLayer.h"

@implementation implicitAnimationLayer

-(void)drawInContext:(CGContextRef)ctx {
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
}

@end
