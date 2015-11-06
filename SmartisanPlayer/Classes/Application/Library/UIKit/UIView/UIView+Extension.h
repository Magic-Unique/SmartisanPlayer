//
//  UIView+Extension.h
//  Tools
//
//  Created by Magic_Unique on 15/8/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *  在通过本Extension修改View的frame时, 建议先修改View的Size, 再修改View的坐标
 */

/**
 *  本组为设置View的坐标, 不会改变View的大小. "toSuperView***"在superView不存在的情况下默认为keyWindow.
 */
@property (nonatomic, assign) CGFloat minX;
@property (nonatomic, assign) CGFloat minY;
@property (nonatomic, assign) CGFloat midX;
@property (nonatomic, assign) CGFloat midY;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;

@property (nonatomic, assign) CGFloat toSuperViewLeft;
@property (nonatomic, assign) CGFloat toSuperViewRight;
@property (nonatomic, assign) CGFloat toSuperViewTop;
@property (nonatomic, assign) CGFloat toSuperViewBottom;

/**
 *  将self移动到view的左边/右边/顶边/底边, get方法永远返回nil
 */
@property (nonatomic, weak) UIView *leftView;
@property (nonatomic, weak) UIView *rightView;
@property (nonatomic, weak) UIView *topView;
@property (nonatomic, weak) UIView *bottomView;

/**
 *  本组为View的大小，设置side等价于同时设置width和height
 */
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat side;

/**
 *  本组设置width和height，前提是保持面积不变，其get方法和对应属性等价
 */
@property (nonatomic, assign) CGFloat widthWithLockArea;
@property (nonatomic, assign) CGFloat heightWithLockArea;

/**
 *  本组设置width和height，前提是保持周长不变，其get方法和对应属性等价
 */
@property (nonatomic, assign) CGFloat widthWithLockCircumference;
@property (nonatomic, assign) CGFloat heightWithLockCircumference;

/**
 *  本组获取View的周长和面积
 */
@property (nonatomic, assign, readonly) CGFloat circumference;
@property (nonatomic, assign, readonly) CGFloat area;

/**
 *  本组设置View的结构体
 */
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign, readonly) CGSize halfSize;//自己size的1/4
@property (nonatomic, assign, readonly) CGPoint midPoint;//自己的中心


/**
 *  设置自己与view的相对位置.
 *  leftIn ==> self.left = view.left + margin
 *  leftTo ==> self.left = view.right + margin
 *
 *  @param view   相对视图
 *  @param margin 边距
 */

- (void)setLeftInView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setLeftToView:(UIView *)view withMargin:(CGFloat)margin;

- (void)setRightInView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setRightToView:(UIView *)view withMargin:(CGFloat)margin;

- (void)setTopInView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setTopToView:(UIView *)view withMargin:(CGFloat)margin;

- (void)setBottomInView:(UIView *)view withMargin:(CGFloat)margin;
- (void)setBottomToView:(UIView *)view withMargin:(CGFloat)margin;
@end
