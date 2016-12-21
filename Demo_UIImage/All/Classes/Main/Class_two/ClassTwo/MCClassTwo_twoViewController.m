//
//  MCClassTwo_twoViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassTwo_twoViewController.h"

@interface MCClassTwo_twoViewController ()

@property (nonatomic,strong) UIButton * button;

@property (nonatomic,strong) UIButton * button_two;

@property (nonatomic,strong) UIButton * button_three;


@end

@implementation MCClassTwo_twoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(10, 140, 400, 40);
    UIImage * image = [UIImage imageNamed:@"red"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width / 2 topCapHeight:image.size.height / 2];
    [self.button setBackgroundImage:image forState:UIControlStateNormal];;
    [self.view addSubview:self.button];
    
    
    
    
    
    CGFloat top = 19.5; // 顶端盖高度
    CGFloat bottom = 19.5; // 底端盖高度
    CGFloat left = 100; // 左端盖宽度
    CGFloat right = 100; // 右端盖宽度
    UIEdgeInsets capInsets = UIEdgeInsetsMake(top, left, bottom, right);
    
    UIImage * image2 = [UIImage imageNamed:@"red"];
    
    // 重新赋值
    image2 = [image2 resizableImageWithCapInsets: capInsets];
    
    
    self.button_two = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button_two.frame = CGRectMake(10, 240, 400, 40);
    [self.button_two setBackgroundImage:image2 forState:UIControlStateNormal];;
    [self.view addSubview:self.button_two];
    
    
    
    
    /**
     typedef NS_ENUM(NSInteger, UIImageResizingMode) {
     UIImageResizingModeTile,
     UIImageResizingModeStretch,
     };
     */
    UIImage * image3 = [UIImage imageNamed:@"1"];
    image3 = [image3 resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeTile];
    
    self.button_three = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button_three.frame = CGRectMake(10, 340, 400, 40);
    [self.button_three setBackgroundImage:image3 forState:UIControlStateNormal];;
    [self.view addSubview:self.button_three];
    
}


@end

