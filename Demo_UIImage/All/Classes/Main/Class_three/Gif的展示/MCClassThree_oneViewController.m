//
//  MCClassThree_oneViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassThree_oneViewController.h"

@interface MCClassThree_oneViewController ()

@end

@implementation MCClassThree_oneViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    //    [self gifImageView];
    
    [self showGifWithWebView];
}


#pragma mark - 系统代理

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"";
}

- (void)gifImageView
{
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    gifImageView.backgroundColor = [UIColor orangeColor];
    NSArray *gifArray = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"1.png"],
                         [UIImage imageNamed:@"2.png"],
                         [UIImage imageNamed:@"3.png"],
                         [UIImage imageNamed:@"4.png"],
                         [UIImage imageNamed:@"5.png"],
                         [UIImage imageNamed:@"6.png"],
                         [UIImage imageNamed:@"7.png"],
                         [UIImage imageNamed:@"8.png"],
                         
                         nil];
    gifImageView.animationImages = gifArray; //动画图片数组
    gifImageView.animationDuration = 5; //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = MAXFLOAT;  //动画重复次数
    [gifImageView startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // [gifImageView stopAnimating];
    });
    
    [self.view addSubview:gifImageView];
}

- (void)showGifWithWebView
{
    //    CGRect frame = CGRectMake(50,50,0,0);
    //    frame.size = [UIImage imageNamed:@"gif.gif"].size;
    //    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"gif" ofType:@"gif"]];
    
    
    
    UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, -44, self.view.bounds.size.width, self.view.bounds.size.height + 44)];
    webView.userInteractionEnabled = NO;
    webView.backgroundColor = [UIColor redColor];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"index"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [webView loadHTMLString:htmlCont baseURL:baseURL];
    
    
    [self.view addSubview:webView];
}
#pragma mark - setter & getter

@end

