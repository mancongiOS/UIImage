//
//  MCClassOne_twoViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassOne_twoViewController.h"

#import "Masonry.h"
#import "UIImage+ImageCut.h"

@interface MCClassOne_twoViewController ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation MCClassOne_twoViewController

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

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"图片的剪切";
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
        
        
#warning 学习圆周率相关的知识
        
        UIImage * image = [UIImage imageNamed:@"1.jpg"];
        // 截取原图中间300*300
        CGFloat cutImageWH = 300;
        CGFloat cutImage_x = (image.size.width - 300) / 2;
        CGFloat cutImage_y = (image.size.height - 300) / 2;
        
        self.imageView.image = [image imagecutWithRect:CGRectMake(cutImage_x, cutImage_y, cutImageWH, cutImageWH)];
    } return _imageView;
}

@end
