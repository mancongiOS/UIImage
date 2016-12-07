//
//  MCClassOne_mainViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassOne_mainViewController.h"

#import "Masonry.h"


#import "MCClassOne_oneViewController.h"
#import "MCClassOne_twoViewController.h"
#import "MCClassOne_threeViewController.h"
#import "MCClassOne_fourViewController.h"
#import "MCClassOne_fivwViewController.h"
#import "MCClassOne_sixViewController.h"
#import "MCClassOne_sevenViewController.h"

@interface MCClassOne_mainViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArrayM;

@end

@implementation MCClassOne_mainViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTableView];
    
    [self createData];
}


#pragma mark - 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * idetifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    
    cell.textLabel.text = self.dataArrayM[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MCClassOne_oneViewController * oneViewController = [[MCClassOne_oneViewController alloc] init];
        [self.navigationController pushViewController:oneViewController animated:YES];
    } else if (indexPath.row == 1) {
    
        MCClassOne_twoViewController * twoViewController = [[MCClassOne_twoViewController alloc] init];
        [self.navigationController pushViewController:twoViewController animated:YES];
    } else if (indexPath.row == 2) {
    
        MCClassOne_threeViewController * threeViewController = [[MCClassOne_threeViewController alloc] init];
        [self.navigationController pushViewController:threeViewController animated:YES];
    } else if (indexPath.row == 3) {
        MCClassOne_fourViewController * fourViewController = [[MCClassOne_fourViewController alloc] init];
        [self.navigationController pushViewController:fourViewController animated:YES];
    } else if (indexPath.row == 4) {
        MCClassOne_fivwViewController * fiveViewController = [[MCClassOne_fivwViewController alloc] init];
        [self.navigationController pushViewController:fiveViewController animated:YES];
    } else if (indexPath.row == 5) {
        MCClassOne_sixViewController * sixViewController = [[MCClassOne_sixViewController alloc] init];
        [self.navigationController pushViewController:sixViewController animated:YES];
    } else if (indexPath.row == 6) {
        MCClassOne_sevenViewController * sevenViewController = [[MCClassOne_sevenViewController alloc] init];
        [self.navigationController pushViewController:sevenViewController animated:YES];
    }
}

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"UIImage";
    
}

- (void)addTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)createData
{
    NSArray * array = @[@"图片旋转",@"图片剪切",@"裁切一个圆形头像",@"图片的拉伸",@"屏幕截屏",@"给图片添加水印",@"毛玻璃效果"];
    
    self.dataArrayM = [NSMutableArray arrayWithArray:array];
    
    [self.tableView reloadData];
}

#pragma mark - setter & getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArrayM
{
    if (!_dataArrayM)
    {
        self.dataArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArrayM;
}

@end
