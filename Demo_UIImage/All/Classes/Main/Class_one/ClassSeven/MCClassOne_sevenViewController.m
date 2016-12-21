//
//  MCClassOne_sevenViewController.m
//  Demo_UIImage
//
//  Created by goulela on 16/12/7.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCClassOne_sevenViewController.h"
#import "Masonry.h"
#import <Accelerate/Accelerate.h>

#define kSCreenSize [UIScreen mainScreen].bounds.size

@interface MCClassOne_sevenViewController ()

@property (nonatomic, strong) UIImageView * originalImageView;
@property (nonatomic, strong) UIImageView * blurryImageView;
@end

@implementation MCClassOne_sevenViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    
    [self initUI];
}



#pragma mark - 实现方法
// 出入UIImage  和  blur模糊成度 (0-1)
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    
    /** 注意点:
     1. 需要引入#import <Accelerate/Accelerate.h>
     2. blur 的范围必须在0-1中间,否则强制为0.5
     3.
     */
    
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 100);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}

#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"毛玻璃效果";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    [self.view addSubview:self.originalImageView];
    [self.originalImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view).with.offset(50);
        make.right.mas_equalTo(self.view).with.offset(-50);
        make.top.mas_equalTo(self.view).with.offset(74);
        make.height.mas_equalTo(kSCreenSize.width - 100);
    }];
    
    [self.view addSubview:self.blurryImageView];
    [self.blurryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view).with.offset(50);
        make.right.mas_equalTo(self.view).with.offset(-50);
        make.top.mas_equalTo(self.originalImageView.mas_bottom).with.offset(30);
        make.height.mas_equalTo(kSCreenSize.width - 100);
    }];
}


#pragma mark - setter & getter
- (UIImageView *)originalImageView {
    if (_originalImageView == nil) {
        self.originalImageView = [[UIImageView alloc] init];
        self.originalImageView.image = [UIImage imageNamed:@"blurry.jpg"];
    } return _originalImageView;
}


- (UIImageView *)blurryImageView {
    if (_blurryImageView == nil) {
        self.blurryImageView = [[UIImageView alloc] init];
        UIImage * image = [UIImage imageNamed:@"blurry.jpg"];
        self.blurryImageView.image = [self blurryImage:image withBlurLevel:0.8];
    } return _blurryImageView;
}

@end
