//
//  PJRadarView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "PJRadarView.h"

@implementation PJRadarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup {

    if (!self.indicatorView) {
    
        PJRadarIndicatorView *indicatorView = [[PJRadarIndicatorView alloc] initWithFrame:self.bounds];
        [self addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    
    if (!self.textLabel) {
    
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.center.y + self.radius, WIDTH, 30)];
        [self addSubview:textLabel];
        _textLabel = textLabel;
    }
    
    if (!self.pointsView) {
    
        UIView *pointsView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:pointsView];
        _pointsView = pointsView;
    }
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 1. 绘制背景图片
    if (self.backgroundImage) {
    
        UIImage *image = self.backgroundImage;
        [image drawInRect:self.bounds];
    }
    
    // 2. 获取圈的个数
    NSUInteger sectionsNum = RADAR_DEFAULT_SECTIONS_NUM;
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInRadarView:)]) {
    
        sectionsNum = [self.dataSource numberOfSectionsInRadarView:self];
    }
    
    // 3. 获取半径
    CGFloat radius = RADAR_DEFAULT_RADIUS;
    if (self.radius) {
    
        radius = self.radius;
    }
    
    // 4. 设置指示器的角度
    CGFloat indicatorAngle = INDICATOR_ANGLE;
    if (self.indicatorAngle) {
    
        indicatorAngle = self.indicatorAngle;
    }
    
    // 5. 获取转动的方向
    BOOL indicatorClockwise = INDICATOR_CLOCKWISE;
    if (self.indicatorClockwise) {
    
        indicatorClockwise = self.indicatorClockwise;
    }
    
    // 6. 获取指示器开始的颜色
    UIColor *indicatorStartColor = INDICATOR_START_COLOR;
    if (self.indicatorStartColor) {
    
        indicatorStartColor = self.indicatorStartColor;
    }
    
    // 7. 获取指示器结束的颜色
    UIColor *indicatorEndColor = INDICATOR_END_COLOR;
    if (self.indicatorEndColor) {
    
        indicatorEndColor = self.indicatorEndColor;
    }
    
    // 2.1 绘制显示的图形
    CGFloat sectionRadius = radius / sectionsNum;
    for (int i = 0; i<sectionsNum; i++) {
    
        // 1. 花边框圆
        CGContextSetLineWidth(ctx, 1.0);
        CGContextSetRGBStrokeColor(ctx, 1, 1, 1, (1-(float)i/(sectionsNum + 1))*0.5);
        CGContextAddArc(ctx, self.center.x, self.center.y, sectionRadius - 5*(sectionsNum - i - 1), 0, 2*M_PI, 0);
        CGContextDrawPath(ctx, kCGPathStroke);  // 绘制路线
        
        sectionRadius += radius/sectionsNum;  // 计算半径
    }
    
    // 2.2 设置指示器
    if (self.indicatorView) {
        
        self.indicatorView.frame = self.bounds;
        self.indicatorView.backgroundColor = [UIColor clearColor];
        self.indicatorView.radius = self.radius;
        self.indicatorView.angle = indicatorAngle;
        self.indicatorView.clockwise = indicatorClockwise;
        self.indicatorView.startColor = indicatorStartColor;
        self.indicatorView.endColor = indicatorEndColor;
    }
    
    // 2.3 设置文字
    if (self.textLabel) {
        
        self.textLabel.frame = CGRectMake(0, self.center.y + ([UIScreen mainScreen].bounds.size.height)/3.3, rect.size.width, 30);
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:13];
        
        if (self.labelText) {
            
            self.textLabel.text = self.labelText;
        }
        
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self bringSubviewToFront:self.textLabel];
    }
}

-(void)setLabelText:(NSString *)labelText {

    _labelText = labelText;
    
    if (self.textLabel) {
    
        self.textLabel.text = labelText;
    }
}

#pragma mark - 方法
-(void)scan {
    
    BOOL indicatorClockwise = INDICATOR_CLOCKWISE;
    if (self.indicatorClockwise) {
        indicatorClockwise = self.indicatorClockwise;
    }

    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue = [NSNumber numberWithFloat: (indicatorClockwise?1:-1) * M_PI * 2.0 ];
    rotationAnimation.duration = 360.f/RADAR_ROTATE_SPEED;
    rotationAnimation.repeatCount = INT_MAX;
    [_indicatorView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)stop {

    [_indicatorView.layer removeAnimationForKey:@"rotationAnimation"];
}

-(void)show {

    for (UIView *subView in self.pointsView.subviews) {
    
        [subView removeFromSuperview];
    }
    
    if ([self.dataSource respondsToSelector:@selector(numberOfPointsInRadarView:)]) {
    
        NSUInteger pointsNum = [self.dataSource numberOfPointsInRadarView:self];
        for (int index = 0; index < pointsNum; index++) {
        
            if ([self.dataSource respondsToSelector:@selector(radarView:pointForIndex:)]) {
            
                if ([self.dataSource respondsToSelector:@selector(radarView:pointPositionForIndex:)]) {
                
                    CGPoint point = [self.dataSource radarView:self pointPositionForIndex:index];
                    int posDirection = point.x;     //方向(角度)
                    int posDistance = point.y;    //距离(半径)
                    
                    PJRadarPointView *pointView = [[PJRadarPointView alloc] initWithFrame:CGRectZero];
                    
                    UIView *customView = [self.dataSource radarView:self pointForIndex:index];
                    [pointView addSubview:customView];
                    
                    pointView.tag = index;
                    
                    pointView.frame = customView.frame;
                    pointView.center = CGPointMake(self.center.x + posDistance*sin(DEGREES_TO_RADIANS(posDirection)), self.center.y + posDistance*cos(DEGREES_TO_RADIANS(posDirection)));
                    pointView.delegate = self;
                    
                    // 星星出现的动画
                    pointView.alpha = 0.0;
                    CGAffineTransform fromTransform = CGAffineTransformScale(pointView.transform, 0.1, 0.1);
                    [pointView setTransform:fromTransform];
                    
                    // 对前面的操作取反, 相当于设置Scale为 1.0
                    CGAffineTransform toTransform = CGAffineTransformConcat(pointView.transform, CGAffineTransformInvert(pointView.transform));
                    
                    double delayInSeconds = 0.05*index;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                    
                    dispatch_after(popTime, dispatch_get_main_queue(), ^{
                        
                        [UIView beginAnimations:nil context:nil];
                        [UIView setAnimationDuration:0.3];
                        
                        pointView.alpha = 1.0;
                        [pointView setTransform:toTransform];
                        
                        [UIView commitAnimations];
                    });
                    
                    [self.pointsView addSubview:pointView];
                }
            }
        }
        
    }
}

-(void)hide {

}

-(void)didSelectItemRadarPointView:(PJRadarPointView *)radarPointView {

    NSLog(@"select point %ld", radarPointView.tag);
    if ([self.delegate respondsToSelector:@selector(radarView:didSelectItemAtIndex:)]) {
    
        [self.delegate radarView:self didSelectItemAtIndex:radarPointView.tag];
    }
}

@end
