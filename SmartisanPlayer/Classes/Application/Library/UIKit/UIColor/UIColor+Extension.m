//
//  UIColor+Extension.m
//  Tools
//
//  Created by Magic_Unique on 15/8/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "UIColor+Extension.h"

#define randomCGFloat() (arc4random()%256)

@implementation UIColor (Extension)

- (CGFloat)alphaValue {
    CGFloat alpha = 0;
    [self getRed:nil green:nil blue:nil alpha:&alpha];
    return alpha;
}

- (CGFloat)redValue {
    CGFloat red = 0;
    [self getRed:&red green:nil blue:nil alpha:nil];
    return red;
}

- (CGFloat)greenValue {
    CGFloat green = 0;
    [self getRed:nil green:&green blue:nil alpha:nil];
    return green;
}

- (CGFloat)blueValue {
    CGFloat blue = 0;
    [self getRed:nil green:nil blue:&blue alpha:nil];
    return blue;
}

- (CGFloat)hueValue {
    CGFloat hue = 0;
    [self getHue:&hue saturation:nil brightness:nil alpha:nil];
    return hue;
}

- (CGFloat)saturationValue {
    CGFloat saturation = 0;
    [self getHue:nil saturation:&saturation brightness:nil alpha:nil];
    return saturation;
}

- (CGFloat)brightnessValue {
    CGFloat brightness = 0;
    [self getHue:nil saturation:nil brightness:&brightness alpha:nil];
    return brightness;
}

+ (instancetype)randomColor {
    return [self colorWithRandomHue];
}

+ (instancetype)colorWithRandomRGB {
    CGFloat r = randomCGFloat();
    CGFloat g = randomCGFloat();
    CGFloat b = randomCGFloat();
    return MUColorWithRGB(r, g, b);
}

+ (instancetype)colorWithRandomHSB {
    CGFloat h = randomCGFloat();
    CGFloat s = randomCGFloat();
    CGFloat b = randomCGFloat();
    return MUColorWithHSB(h, s, b);
}

+ (instancetype)colorWithRandomARGB {
    CGFloat r = randomCGFloat();
    CGFloat g = randomCGFloat();
    CGFloat b = randomCGFloat();
    CGFloat a = randomCGFloat();
    return MUColorWithARGB(r, g, b, a);
}

+ (instancetype)colorWithRandomAHSB {
    CGFloat h = randomCGFloat();
    CGFloat s = randomCGFloat();
    CGFloat b = randomCGFloat();
    CGFloat a = randomCGFloat();
    return MUColorWithAHSB(h, s, b, a);
}

+ (instancetype)colorWithRandomHue {
    CGFloat h = randomCGFloat();
    return MUColorWithHSB(h, 255, 255);
}

@end
