//
//  UIImage+ImageWaterPrint.m
//  Demo_UIImage
//
//  Created by goulela on 16/11/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "UIImage+ImageWaterPrint.h"

@implementation UIImage (ImageWaterPrint)

- (UIImage *)imageWater:(UIImage *)imageLogo waterString:(NSString *)waterString {

    UIGraphicsBeginImageContext(self.size);
    
    // 原始图片渲染
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    CGFloat waterX = self.size.width - 200;
    CGFloat waterY = self.size.height - 200;
    CGFloat waterW = 200;
    CGFloat waterH = 200;
    
    // logo 渲染
    [imageLogo drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 渲染文字
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary * dic = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:40],
                           NSParagraphStyleAttributeName : paragraphStyle,
                           NSForegroundColorAttributeName : [UIColor redColor]
                           };
    
    [waterString drawInRect:CGRectMake(50, 50, 200, 50) withAttributes:dic];
    
    UIGraphicsEndPDFContext();
    
    // UIImage
    UIImage * imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    return imageNew;
}

@end
