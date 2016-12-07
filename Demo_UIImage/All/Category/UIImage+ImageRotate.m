//
//  UIImage+ImageRotate.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "UIImage+ImageRotate.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

@implementation UIImage (ImageRotate)

#pragma mark - 图片旋转

// 1 image --> Context 2. context  3. context --> image

- (UIImage *)imageRotateWithIndegree:(CGFloat)indegree {
    
    // 1. image --> context
    size_t width = (size_t)(self.size.width * self.scale);
    size_t height = (size_t)(self.size.height * self.scale);

    size_t bytesPerRow = width * 4;                        // 每行图片字节数
    CGImageAlphaInfo alphaInfo = kCGImageAlphaPremultipliedFirst;      // alpha
    
    // 配置上下文
    //    CGColorRef bmContext = CGBitmapContextCreate(<#void * _Nullable data#>, <#size_t width#>, <#size_t height#>, <#size_t bitsPerComponent#>, <#size_t bytesPerRow#>, <#CGColorSpaceRef  _Nullable space#>, <#uint32_t bitmapInfo#>)
    CGContextRef bmContext = CGBitmapContextCreate(NULL, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault | alphaInfo);
    
    if (!bmContext) {
        return nil;
    }
    
    CGContextDrawImage(bmContext, CGRectMake(0, 0, width, height), self.CGImage);
    
    
    // 2. 旋转
    UInt8 * data = (UInt8 *)CGBitmapContextGetData(bmContext);
    
    // 需要引入 #import <Accelerate/Accelerate.h>  解释这个类干什么用的
    vImage_Buffer src = {data,height,width,bytesPerRow};
    vImage_Buffer dest = {data,height,width,bytesPerRow};
    Pixel_8888 bgColor = {0,0,0,0};
    vImageRotate_ARGB8888(&src, &dest, NULL, indegree, bgColor, kvImageBackgroundColorFill);
    

    // 3. context --> UIImage
    CGImageRef rotateImageRef = CGBitmapContextCreateImage(bmContext);
    UIImage * rotateImage = [UIImage imageWithCGImage:rotateImageRef scale:self.scale orientation:self.imageOrientation];
    

    CGContextRelease(bmContext);
    CGImageRelease(rotateImageRef);
    
    
    return rotateImage;
}

@end
