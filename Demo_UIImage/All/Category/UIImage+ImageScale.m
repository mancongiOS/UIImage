//
//  UIImage+ImageScale.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "UIImage+ImageScale.h"

@implementation UIImage (ImageScale)

- (UIImage *)imageScaleSize:(CGSize)size {

#warning 这个图片的缩放什么意思? 
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
