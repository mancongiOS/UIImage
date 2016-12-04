//
//  UIView+ImageScreenShot.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "UIView+ImageScreenShot.h"

@implementation UIView (ImageScreenShot)

- (UIImage *)imageScreenShot {

    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return image;
}

@end
