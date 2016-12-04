//
//  MCClassThree_threeViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassThree_threeViewController.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface MCClassThree_threeViewController ()

@end

@implementation MCClassThree_threeViewController

/**
 1. 数据获取
 2. 创建Gif文件
 3. 配置Gif属性
 4. 单帧添加到gif
 */

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"gif的合成";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createGif];
}

- (void)createGif {

    // 1. 获取数据
    NSMutableArray * imageArrayM = [NSMutableArray arrayWithCapacity:0];
    [imageArrayM addObject:[UIImage imageNamed:@"1.png"]];
    [imageArrayM addObject:[UIImage imageNamed:@"2"]];
    [imageArrayM addObject:[UIImage imageNamed:@"3"]];
    [imageArrayM addObject:[UIImage imageNamed:@"4"]];
    [imageArrayM addObject:[UIImage imageNamed:@"5"]];
    [imageArrayM addObject:[UIImage imageNamed:@"6"]];
    [imageArrayM addObject:[UIImage imageNamed:@"7"]];
    [imageArrayM addObject:[UIImage imageNamed:@"8"]];

    // 2. 创建Gif文件
    NSArray * document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentStr = [document objectAtIndex:0];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * textDic = [documentStr stringByAppendingString:@"/gif"];
    [fileManager createDirectoryAtPath:textDic withIntermediateDirectories:YES attributes:nil error:nil];
    NSString * path = [textDic stringByAppendingString:@"test1.gif"];
    NSLog(@"path: %@",path);
    
    // 3. 配置gif属性
    CGImageDestinationRef destion;
    // 将path映射成url对象
    CFURLRef url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)path, kCFURLPOSIXPathStyle, false);
    destion = CGImageDestinationCreateWithURL(url, kUTTypeGIF, imageArrayM.count, NULL);

    NSMutableDictionary * dictM = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.3],(NSString *)kCGImagePropertyGIFDelayTime, nil];
    NSDictionary * frameDic = [NSDictionary dictionaryWithObject:dictM forKey:(NSString *)kCGImagePropertyGIFDelayTime];
    
    NSMutableDictionary * gifParaDict = [NSMutableDictionary dictionaryWithCapacity:2];
    
    // 设置颜色
    [gifParaDict setObject:[NSNumber numberWithBool:YES] forKey:(NSString *)kCGImagePropertyGIFHasGlobalColorMap];
    
    // 设置模式
    [gifParaDict setObject:(NSString *)kCGImagePropertyColorModelRGB forKey:(NSString *)kCGImagePropertyColorModel];
    
    // 设置颜色深度
    [gifParaDict setObject:[NSNumber numberWithInt:8] forKey:(NSString *)kCGImagePropertyDepth];
    
    // 是否可以重复播放
    [gifParaDict setObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
    
    NSDictionary * gifProperty = [NSDictionary dictionaryWithObject:gifParaDict forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    // 单帧添加到gif
    for (UIImage * dImage in imageArrayM) {
        CGImageDestinationAddImage(destion, dImage.CGImage, (__bridge CFDictionaryRef)frameDic);
    }
    
    CGImageDestinationSetProperties(destion, (__bridge CFDictionaryRef)gifProperty);
    CGImageDestinationFinalize(destion);
    CFRelease(url);
    CFRelease(destion);
}

@end
