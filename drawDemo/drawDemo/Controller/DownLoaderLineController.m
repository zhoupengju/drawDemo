

//
//  DownLoaderLineController.m
//  drawDemo
//
//  Created by 周鹏钜 on 16/11/8.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "ProgressView.h"
#import "DownLoaderLineController.h"

static NSUInteger indexFlag = 0;

@interface DownLoaderLineController ()

@property (nonatomic, weak) ProgressView *progressView;

@property (nonatomic, strong) UILabel *labelProgress;

@property (nonatomic, strong) CADisplayLink *timerDisplayLink;

@end

@implementation DownLoaderLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(80, 100, 200, 200)];
    [self.view addSubview:bgView];
    
    // 如果不添加到view上面, 界面会卡死
    ProgressView *progressView = [[ProgressView alloc] initWithFrame:bgView.bounds];
    self.progressView = progressView;
    [bgView addSubview:progressView];
    
    progressView.backgroundColor = [UIColor redColor];
    
    
    UILabel *labelProgress = [[UILabel alloc] initWithFrame:CGRectMake(20, 90, 160, 20)];
    [bgView addSubview:labelProgress];
    self.labelProgress = labelProgress;
    
    labelProgress.textAlignment = NSTextAlignmentCenter;

    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CADisplayLink *timerDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(testLinkTimer)];
    self.timerDisplayLink = timerDisplayLink;
    [timerDisplayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)testLinkTimer {
    
    if (indexFlag == 1000) {
        
        [self.timerDisplayLink invalidate];
        self.timerDisplayLink = nil;
    }
    
    self.progressView.progressValue = indexFlag*0.001;
    self.labelProgress.text = [NSString stringWithFormat:@"%.2f%%",indexFlag*0.001];
    
    indexFlag++;
}

@end
