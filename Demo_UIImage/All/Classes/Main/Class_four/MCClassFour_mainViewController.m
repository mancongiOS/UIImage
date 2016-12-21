//
//  MCClassFour_mainViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/12/21.
//  Copyright © 2016年 MC. All rights reserved.
//





#import "MCClassFour_mainViewController.h"

#import "Masonry.h"

#import "UIImage+fixOrientation.h"

@interface MCClassFour_mainViewController ()

@property (nonatomic, strong) UIImageView * oneImageView;
@property (nonatomic, strong) UIImageView * twoImageView;


@end

@implementation MCClassFour_mainViewController

/** explain
 1. 技术支持: http://www.cocoachina.com/ios/20150605/12021.html
 2. 造成图片旋转的原因
 用相机拍摄出来的照片含有EXIF信息，UIImage的imageOrientation属性指的就是EXIF中的orientation信息。
 如果我们忽略orientation信息，而直接对照片进行像素处理或者drawInRect等操作，得到的结果是翻转或者旋转90之后的样子。这是因为我们执行像素处理或者drawInRect等操作之后，imageOrientaion信息被删除了，imageOrientaion被重设为0，造成照片内容和imageOrientaion不匹配。
 所以，在对照片进行处理之前，先将照片旋转到正确的方向，并且返回的imageOrientaion为0。
 下面这个方法就是一个UIImage category中的方法，用它可以达到以上目的。
 */

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    
    [self initUI];
}


#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"ImageOrientation";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    [self.view addSubview:self.oneImageView];
    [self.oneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_centerY).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];
    
    [self.view addSubview:self.twoImageView];
    [self.twoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_centerY).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];
}


#pragma mark - setter & getter
- (UIImageView *)oneImageView {
    if (_oneImageView == nil) {
        self.oneImageView = [[UIImageView alloc] init];
        UIImage * image = [UIImage imageNamed:@"ImageOrientation.jpg"];
        
        NSLog(@"image: %ld",(long)image.imageOrientation);
        
        self.oneImageView.image = image;
    } return _oneImageView;
}

- (UIImageView *)twoImageView {
    if (_twoImageView == nil) {
        self.twoImageView = [[UIImageView alloc] init];
        UIImage * image = [UIImage imageNamed:@"ImageOrientation.jpg"];
        
        NSLog(@"image: %@",image);
        
        UIImage * endImage = [image fixOrientation];
        
        self.twoImageView.image = endImage;
    } return _twoImageView;
}

@end
