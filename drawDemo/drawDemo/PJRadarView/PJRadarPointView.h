//
//  PJRadarPointView.h
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/10.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PJRadarPointView;

@protocol PJRadarPointViewDelegate <NSObject>

@optional

- (void)didSelectItemRadarPointView:(PJRadarPointView *)radarPointView; //点击事件

@end

@interface PJRadarPointView : UIView

//@property (nonatomic, copy) void(^radarPointViewBlock)(PJRadarPointView *pointView);
@property (nonatomic, strong) id<PJRadarPointViewDelegate> delegate;

@end
