//
//  UIColor+Extension.h
//  Tools
//
//  Created by Magic_Unique on 15/8/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MUColorWithRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define MUColorWithHSB(h, s, b) [UIColor colorWithHue:(h)/255.0 saturation:(s)/255.0 brightness:(b)/255.0 alpha:1.0]
#define MUColorWithARGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define MUColorWithAHSB(h, s, b, a) [UIColor colorWithHue:(h)/255.0 saturation:(s)/255.0 brightness:(b)/255.0 alpha:(a)/255.0]

@interface UIColor (Extension)


/**
 *  本组读取Color的配色值
 */
@property (nonatomic, assign, readonly) CGFloat alphaValue;

@property (nonatomic, assign, readonly) CGFloat redValue;
@property (nonatomic, assign, readonly) CGFloat greenValue;
@property (nonatomic, assign, readonly) CGFloat blueValue;

@property (nonatomic, assign, readonly) CGFloat hueValue;
@property (nonatomic, assign, readonly) CGFloat saturationValue;
@property (nonatomic, assign, readonly) CGFloat brightnessValue;


+ (instancetype)randomColor;
+ (instancetype)colorWithRandomRGB;
+ (instancetype)colorWithRandomHSB;
+ (instancetype)colorWithRandomARGB;
+ (instancetype)colorWithRandomAHSB;
+ (instancetype)colorWithRandomHue;

@end
