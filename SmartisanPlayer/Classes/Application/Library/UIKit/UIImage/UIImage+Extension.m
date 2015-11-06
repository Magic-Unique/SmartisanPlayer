//
//  UIImage+Extension.m
//  Tools
//
//  Created by Magic_Unique on 15/8/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Scale)

+ (instancetype)imageWithImage:(UIImage *)image toNewSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGRect frame = CGRectZero;
    frame.size = size;
    [image drawInRect:frame];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)imageWithImage:(UIImage *)image toPercentScale:(NSUInteger)percentScale {
    CGSize size = image.size;
    size.width *= percentScale / 100.0;
    size.height *= percentScale / 100.0;
    return [self imageWithImage:image toNewSize:size];
}

+ (instancetype)imageWithImage:(UIImage *)image outOfCircumscribedSize:(CGSize)size {
    NSUInteger wScale = size.width / image.size.width * 100;
    NSUInteger hScale = size.height / image.size.height * 100;
    return [self imageWithImage:image toPercentScale:MAX(wScale, hScale)];
}

+ (instancetype)imageWithImage:(UIImage *)image inOfCircumscribedSize:(CGSize)size {
    NSUInteger wScale = size.width / image.size.width * 100;
    NSUInteger hScale = size.height / image.size.height * 100;
    return [self imageWithImage:image toPercentScale:MIN(wScale, hScale)];
}

@end


@implementation UIImage (Create)

+ (instancetype)imageWithColor:(UIColor *)color andSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    [color setFill];
    UIRectFillUsingBlendMode(CGRectMake(0, 0, size.width, size.height), kCGBlendModeXOR);
    CGImageRef cgImageRef = CGBitmapContextCreateImage(UIGraphicsGetCurrentContext());
    
    UIGraphicsEndImageContext();
    return [UIImage imageWithCGImage:cgImageRef];
}

+ (instancetype)imageWithImage:(UIImage *)image mask:(UIImage *)mask option:(UIImageMaskOption)option {
    UIGraphicsBeginImageContextWithOptions(mask.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectZero;
    rect.size = mask.size;
    CGContextClipToMask(context, rect, mask.CGImage);
    //调整图片rect
    switch (option) {
        case UIImageMaskOptionFillWithScale:
            break;
        case UIImageMaskOptionCenterWithoutScale: {
            rect.origin.x = (image.size.width - rect.size.width) * 0.5 * -1;
            rect.origin.y = (image.size.height - rect.size.height) * 0.5 * -1;
            rect.size = image.size;
            break;
        }
        case UIImageMaskOptionCircumscribedIn: {
            NSUInteger wScale = rect.size.width / image.size.width * 100;
            NSUInteger hScale = rect.size.height / image.size.height * 100;
            NSUInteger scale = MIN(wScale, hScale);
            rect.size.width = scale / 100.0 * image.size.width;
            rect.size.height = scale / 100.0 * image.size.height;
            if (rect.size.width > rect.size.height) {
                rect.origin.x = 0;
                rect.origin.y = (mask.size.height - rect.size.height) * 0.5;
            } else {
                rect.origin.y = 0;
                rect.origin.x = (mask.size.width - rect.size.width) * 0.5;
            }
            break;
        }
        case UIImageMaskOptionCircumscribedOut: {
            NSUInteger wScale = rect.size.width / image.size.width * 100;
            NSUInteger hScale = rect.size.height / image.size.height * 100;
            NSUInteger scale = MAX(wScale, hScale);
            rect.size.width = scale / 100.0 * image.size.width;
            rect.size.height = scale / 100.0 * image.size.height;
            if (rect.size.width > rect.size.height) {
                rect.origin.y = 0;
                rect.origin.x = (mask.size.width - rect.size.width) * 0.5;
            } else {
                rect.origin.x = 0;
                rect.origin.y = (mask.size.height - rect.size.height) * 0.5;
            }
            break;
        }
        default:
            break;
    }
    
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end




@implementation UIImage (Extension)

- (instancetype)imageWithRenderingColor:(UIColor *)color {
    return [UIImage imageWithColor:color andSize:self.size];
}

- (instancetype)imageWithNewSize:(CGSize)size {
    return [UIImage imageWithImage:self toNewSize:size];
}

- (instancetype)imageWithPercentScale:(NSUInteger)percentScale {
    return [UIImage imageWithImage:self toPercentScale:percentScale];
}

- (instancetype)imageWithOutOfCircumscribedSize:(CGSize)size {
    return [UIImage imageWithImage:self outOfCircumscribedSize:size];
}

- (instancetype)imageWithInOfCircumscribedSize:(CGSize)size {
    return [UIImage imageWithImage:self inOfCircumscribedSize:size];
}

- (instancetype)imageWithMask:(UIImage *)mask option:(UIImageMaskOption)option {
    return [UIImage imageWithImage:self mask:mask option:option];
}

@end
