//
//  HT_WaterView.m
//  hentane_App
//
//  Created by hetane on 16/11/7.
//  Copyright © 2016年 hetane. All rights reserved.
//

#import "HT_WaterView.h"

@interface HT_WaterView ()
{
    UIColor *_currentWaterColor;
    
    float _currentLinePointY;
    
    float a;
    float b;
    
    BOOL isIncrease;
}

@end

@implementation HT_WaterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        a = 1.5;
        b = 0;
        isIncrease = NO;

        _currentWaterColor = [UIColor colorWithWhite:0xffffff alpha:0.09];
        _currentLinePointY = 15;
        
        [NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
    }
    return self;
}

-(void)animateWave
{
    if (isIncrease) {
        a += 0.01;
    }else{
        a -= 0.01;
    }
    
    if (a<=1) {
        isIncrease = YES;
    }
    
    if (a>=1.5) {
        isIncrease = NO;
    }
    
    b+=0.1;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水
//    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    
    float y=_currentLinePointY;
    
    CGPathMoveToPoint(path, NULL, 0, y);
    
    for(float x=0;x<=WIDTH;x++){
        
        y= a * sin( x/180*M_PI + 4*b/M_PI ) * 5 + _currentLinePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, WIDTH, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}

@end
