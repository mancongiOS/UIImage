//
//  MCClassOne_fivwViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassOne_fivwViewController.h"
#import "Masonry.h"
#import "UIView+ImageScreenShot.h"

@interface MCClassOne_fivwViewController ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation MCClassOne_fivwViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self initUI];
}


#pragma mark - 系统代理

#pragma mark - 点击事件
- (void)tap {

    self.view.backgroundColor = [UIColor redColor];
    
    UIImage * image = [self.view imageScreenShot];
    
    
    if (image) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.imageView.image = image;
    }
    
    
}

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"屏幕截屏";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initUI {
    
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
}

#pragma mark - setter & getter

- (UIImageView *)imageView {
    if (_imageView == nil) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.backgroundColor = [UIColor redColor];
        
        self.imageView.userInteractionEnabled = YES;
        UIImage * image = [UIImage imageNamed:@"1.jpg"];
        self.imageView.image = image;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self.imageView addGestureRecognizer:tap];
    } return _imageView;
}

@end
