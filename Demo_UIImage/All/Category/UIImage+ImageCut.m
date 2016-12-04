//
//  UIImage+ImageCut.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "UIImage+ImageCut.h"

@implementation UIImage (ImageCut)

- (UIImage *)imagecutWithRect:(CGRect)rect {

    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    
    CGRect smallRect = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    // 开启图形上下文
    UIGraphicsBeginImageContext(smallRect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, smallRect, subImageRef);
    
    UIImage * image = [UIImage imageWithCGImage:subImageRef];
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    CGImageRelease(subImageRef);
    
    return image;
}

@end
