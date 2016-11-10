//
//  PJRadarPointView.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "PJRadarPointView.h"

@implementation PJRadarPointView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 1) {
    
//        if (self.radarPointViewBlock) {
//        
//            self.radarPointViewBlock(self);
//        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItemRadarPointView:)]) {
            
            [self.delegate didSelectItemRadarPointView:self];
        }
    }
}

@end
