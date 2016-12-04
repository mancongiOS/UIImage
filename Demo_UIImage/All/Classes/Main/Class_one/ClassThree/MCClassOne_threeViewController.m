//
//  MCClassOne_threeViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassOne_threeViewController.h"


#import "Masonry.h"
#import "UIImage+ImageCircle.h"

@interface MCClassOne_threeViewController ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation MCClassOne_threeViewController

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
    self.title = @"图片的剪切_圆形头像";
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
        
        
        UIImage * image = [UIImage imageNamed:@"1.jpg"];
        // 裁剪出来一个在原图中心点,半径为四分之一原图宽高最小值的圆.
        
#warning 学习MIN的用法,以及常用的这换种方法
        CGFloat imageSizeMin = MIN(image.size.width, image.size.height);
        
        CGFloat circleImageWH = imageSizeMin;
        CGFloat circleImage_x = (image.size.width - circleImageWH) / 2;
        CGFloat circleImage_y = (image.size.height - circleImageWH) / 2;
        

        self.imageView.image = [image imageClicpCircleWithRect:CGRectMake(circleImage_x, circleImage_y, circleImageWH, circleImageWH)];

    } return _imageView;
}

@end
