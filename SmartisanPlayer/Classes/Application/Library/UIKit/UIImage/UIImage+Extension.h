//
//  UIImage+Extension.h
//  Tools
//
//  Created by Magic_Unique on 15/8/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, UIImageMaskOption) {
    UIImageMaskOptionCenterWithoutScale,
    UIImageMaskOptionFillWithScale,
    UIImageMaskOptionCircumscribedOut,
    UIImageMaskOptionCircumscribedIn,
};

@interface UIImage (Scale)

/**
 *  改变一个图片的大小
 *
 *  @param image 图片
 *  @param size  新的大小
 *
 *  @return UIImage
 */
+ (instancetype)imageWithImage:(UIImage *)image toNewSize:(CGSize)size;

/**
 *  等比例 拉伸 or 缩放 图片
 *
 *  @param image        图片
 *  @param percentScale 比例, 0~100为缩放, 100不变, 100以上为拉伸
 *
 *  @return UIImage
 */
+ (instancetype)imageWithImage:(UIImage *)image toPercentScale:(NSUInteger)percentScale;

/**
 *  改变一个图片大小, 让图片刚好外切size
 *
 *  @param image 图片
 *  @param size  size
 *
 *  @return UIImage
 */
+ (instancetype)imageWithImage:(UIImage *)image outOfCircumscribedSize:(CGSize)size;

/**
 *  改变一个图片大小, 让图片刚好内切size
 *
 *  @param image 图片
 *  @param size  size
 *
 *  @return UIImage
 */
+ (instancetype)imageWithImage:(UIImage *)image inOfCircumscribedSize:(CGSize)size;

@end

@interface UIImage (Create)

/**
 *  创建一个纯色图片
 *
 *  @param color 图片颜色
 *  @param size  图片大小
 *
 *  @return UIImage
 */
+ (instancetype)imageWithColor:(UIColor *)color andSize:(CGSize)size;

/**
 *  用蒙版画一个图片
 *
 *  @param mask  蒙版图片
 *  @param image 源图片
 *
 *  @return UIImage
 */
+ (instancetype)imageWithImage:(UIImage *)image mask:(UIImage *)mask option:(UIImageMaskOption)option;

@end



@interface UIImage (Extension)

/**
 *  用颜色渲染一张同大小的图片
 *
 *  @param color 颜色
 *
 *  @return UIImage
 */
- (instancetype)imageWithRenderingColor:(UIColor *)color;

/**
 *  修改尺寸
 *
 *  @param size 新的尺寸
 *
 *  @return UIImage
 */
- (instancetype)imageWithNewSize:(CGSize)size;

/**
 *  修改比例
 *
 *  @param percentScale 百分比, 0~100为缩放, 100不变, 100~ 为拉伸
 *
 *  @return UIImgae
 */
- (instancetype)imageWithPercentScale:(NSUInteger)percentScale;

/**
 *  将图片比例改为外切于size
 *
 *  @param size size
 *
 *  @return UIImage
 */
- (instancetype)imageWithOutOfCircumscribedSize:(CGSize)size;

/**
 *  将图片比例改为内切于size
 *
 *  @param size size
 *
 *  @return UIImage
 */
- (instancetype)imageWithInOfCircumscribedSize:(CGSize)size;

- (instancetype)imageWithMask:(UIImage *)mask option:(UIImageMaskOption)option;


@end
