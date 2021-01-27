//
//  ViewController.m
//  OC project
//
//  Created by 总受 on 2020/11/18.
//  Copyright © 2020 zou. All rights reserved.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"

//@interface TestView: UIView
//
//@end
//
//@implementation TestView
//
//- (instancetype)init{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}
//
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
//    [super willMoveToSuperview:newSuperview];
//}
//
//-(void)didMoveToSuperview{
//    [super didMoveToSuperview];
//}
//
//-(void)willMoveToWindow:(nullable UIWindow *)newWindow{
//    [super willMoveToWindow:newWindow];
//}
//
//-(void)didMoveToWindow{
//    [super didMoveToWindow];
//}
//
//@end

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//}
//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
//    TestView *view2 = [[TestView alloc] init];
//    view2.backgroundColor = [UIColor greenColor];
//    view2.frame = CGRectMake(150, 150, 100, 100);
//    [self.view addSubview:view2];
//
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [view2 addGestureRecognizer:tapGesture];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *controller = [[UIViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
//    cell.textLabel.text = [NSString stringWithFormat: @"主标题 - %@",@(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";
//    cell.imageView.image = [UIImage imageNamed:@"”];
    [cell layoutTableViewCell];
    return cell;
}


//- (void)pushController{
//
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    viewController.navigationItem.title = @"内容";
//
//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
//
//    [self.navigationController pushViewController:viewController animated:YES];
//}

@end

