//
//  MCClassThree_twoViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassThree_twoViewController.h"

#import <ImageIO/ImageIO.h>     // 图像的输入输出文件
#import <MobileCoreServices/MobileCoreServices.h>

@interface MCClassThree_twoViewController ()

@end

/** Gif的步骤
 1. 拿到Gifd的数据
 2. 将Gif分解为一帧帧
 3. 将单帧数据转为UIImage
 4. 单帧图片保存
 */

@implementation MCClassThree_twoViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self didCompositionGif];
}

#pragma mark - 系统代理

#pragma mark - 点击事件

#pragma mark - 网络请求


#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"git的分解";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didCompositionGif {

    //1. 拿到gif数据
    NSString * gifPathSource = [[NSBundle mainBundle] pathForResource:@"kobe" ofType:@"gif"];
    NSData * data = [NSData dataWithContentsOfFile:gifPathSource];
#warning 桥接的意义 (__bridge CFDataRef)

    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    //2. 将gif分解为一帧帧
    size_t count = CGImageSourceGetCount(source);
    NSLog(@"%zu",count);
    
    NSMutableArray * tmpArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < count; i ++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, i, NULL);
        
        //3. 将单帧数据转为UIImage
        UIImage * image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        [tmpArray addObject:image];
#warning CG类型的对象 不能用ARC自动释放内存.需要手动释放
        CGImageRelease(imageRef);
    }
    CFRelease(source);
    
    // 单帧图片保存
    int i = 0;
    for (UIImage * image  in tmpArray) {
        
        i ++;
        NSData * data = UIImagePNGRepresentation(image);
        NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString * gifPath = path[0];
        NSLog(@"gifPath: %@",gifPath);
        NSString * pathNum = [gifPath stringByAppendingString:[NSString stringWithFormat:@"%d.png",i]];
        [data writeToFile:pathNum atomically:NO];
    }
}

@end
