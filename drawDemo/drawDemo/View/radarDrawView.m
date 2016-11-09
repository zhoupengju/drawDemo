//
//  radarDrawView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/9.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "radarDrawView.h"

@implementation radarDrawView

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawLine];
}

- (void)drawLine {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextStrokePath(ctx);
}

@end
