//
//  UIImage+fixOrientation.h
//  Demo_UIImage
//
//  Created by goulela on 16/12/21.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (fixOrientation)

// 方法一
- (UIImage *)fixOrientation;

// 方法二
- (UIImage *)normalizedImage;

@end
