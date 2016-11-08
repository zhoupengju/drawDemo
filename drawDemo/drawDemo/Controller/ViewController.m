//
//  ViewController.m
//  drawDemo
//
//  Created by hetane on 16/11/7.
//  Copyright © 2016年 hetane. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerHelper.h"

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableview;

@property (nonatomic, strong) NSArray *arrayData;

@end

static NSString *ID = @"UITableViewCell";

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"绘图";
    
    self.arrayData = [ViewControllerHelper dataSource];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableview = tableview;
    [self.view addSubview:tableview];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    ViewControllerModel *model = self.arrayData[indexPath.row];
    
    cell.textLabel.text = model.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewControllerModel *model = self.arrayData[indexPath.row];
    
    UIViewController *vc = [[model.destVc alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    Quartz2DDraw *draw = [[Quartz2DDraw alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:draw];
//    
//    draw.backgroundColor = [UIColor whiteColor];
//    
//    //    self.view.backgroundColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
//    //    VWWWaterView *waterView = [[VWWWaterView alloc]initWithFrame:CGRectMake(0, 100, WIDTH, 30)];
//    //
//    //    [self.view addSubview:waterView];
//    
//    //    [self testShapeLayer];
//}
//
//- (void)testShapeLayer {
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 50)];
//    
//    [path moveToPoint:CGPointMake(50, 250)];
//    [path addLineToPoint:CGPointMake(250, 250)];
//    [path setLineWidth:10];
//    
//    
//    [path stroke];
//    
//    [[UIColor redColor] set];
//    
//    //画扇形
//    //fill(填充之前,会自动关闭路径)
//    [path fill];
//}

@end
