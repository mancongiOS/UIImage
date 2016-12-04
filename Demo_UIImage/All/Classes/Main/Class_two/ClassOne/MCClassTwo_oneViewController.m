//
//  MCClassTwo_oneViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassTwo_oneViewController.h"

@interface MCClassTwo_oneViewController ()

@end

@implementation MCClassTwo_oneViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"jpg <--> png";
    
    [self jpgToPng];
}

// png 图片转化是无损的. 可以有透明效果.
// jpg 图片转化是有损的. 质量因子.

- (void)jpgToPng {

    UIImage * image = [UIImage imageNamed:@"1.jpg"];
    NSData * data = UIImagePNGRepresentation(image);
    UIImage * imagePng = [UIImage imageWithData:data];
    
    // 保存至相册
    UIImageWriteToSavedPhotosAlbum(imagePng, nil, nil, nil);
}

- (void)jpgToJpg {

    UIImage * image = [UIImage imageNamed:@"1.jpg"];
    /** UIImageJPEGRepresentation(<#UIImage * _Nonnull image#>, <#CGFloat compressionQuality#>)
     
     1.参数2--> 质量因子. 范围:0-1之间.(0不清楚,1最清楚)
     2.质量因子越小,图片越小.但是越不清晰.
     */
    NSData * data = UIImageJPEGRepresentation(image, 1);
    UIImage * imagePng = [UIImage imageWithData:data];
    
    // 保存至相册
    UIImageWriteToSavedPhotosAlbum(imagePng, nil, nil, nil);
}

@end
