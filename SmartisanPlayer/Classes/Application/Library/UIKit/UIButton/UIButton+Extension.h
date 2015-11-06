//
//  UIButton+Extension.h
//  Tools
//
//  Created by Magic_Unique on 15/9/10.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIControlStateDeselectNormal        UIControlStateNormal
#define UIControlStateDeselectHighlighted   UIControlStateHighlighted
#define UIControlStateSelectedNormal        UIControlStateSelected
#define UIControlStateSelectedHighlighted   UIControlStateSelected|UIControlStateHighlighted

@interface UIButton (Extension)

@property (nonatomic, strong) NSString *titleForDeselectNormal;
@property (nonatomic, strong) NSString *titleForDeselectHighlighted;
@property (nonatomic, strong) NSString *titleForSelectedNormal;
@property (nonatomic, strong) NSString *titleForSelectedHighlighted;
@property (nonatomic, strong) NSString *titleForDisabled;

@property (nonatomic, strong) UIColor *titleColorForDeselectNormal;
@property (nonatomic, strong) UIColor *titleColorForDeselectHighlighted;
@property (nonatomic, strong) UIColor *titleColorForSelectedNormal;
@property (nonatomic, strong) UIColor *titleColorForSelectedHighlighted;
@property (nonatomic, strong) UIColor *titleColorForDisabled;

@property (nonatomic, strong) UIImage *imageForDeselectNormal;
@property (nonatomic, strong) UIImage *imageForDeselectHighlighted;
@property (nonatomic, strong) UIImage *imageForSelectedNormal;
@property (nonatomic, strong) UIImage *imageForSelectedHighlighted;
@property (nonatomic, strong) UIImage *imageForDisabled;

@property (nonatomic, strong) UIImage *backgroundImageForDeselectNormal;
@property (nonatomic, strong) UIImage *backgroundImageForDeselectHighlighted;
@property (nonatomic, strong) UIImage *backgroundImageForSelectedNormal;
@property (nonatomic, strong) UIImage *backgroundImageForSelectedHighlighted;
@property (nonatomic, strong) UIImage *backgroundImageForDisabled;


@end
