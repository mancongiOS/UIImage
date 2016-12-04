//
//  UIImage+ImageCircle.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "UIImage+ImageCircle.h"

@interface View : UIView
@property (nonatomic, strong) UIImage * image;
@end

@implementation View

#warning draw方法什么时候会调用 和init的区别
- (void)drawRect:(CGRect)rect {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contextRef);
    
    // Ellipse --> 椭圆的
    CGContextAddEllipseInRect(contextRef, CGRectMake(rect.size.width / 4, rect.size.height / 4, rect.size.width / 2, rect.size.height / 2));
    CGContextClip(contextRef);
    CGContextFillPath(contextRef);
    [self.image drawAtPoint:CGPointMake(100, 0)];
    
    CGContextRestoreGState(contextRef);
}
@end

@implementation UIImage (ImageCircle)

- (UIImage *)imageClicpCircleWithRect:(CGRect)rect {
    
    View * myView = [[View alloc] init];
    myView.image = self;
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    myView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    myView.backgroundColor = [UIColor orangeColor];
    [myView.layer renderInContext:context];
    
    UIImage * imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageNew;
}

@end
