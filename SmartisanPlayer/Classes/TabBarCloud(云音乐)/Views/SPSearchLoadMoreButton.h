//
//  SPSearchLoadMoreButton.h
//  SmartisanPlayer
//
//  Created by 吴双 on 15/9/20.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SPSearchLoadMoreButtonState) {
    /** 什么都不显示 */
    SPSearchLoadMoreButtonStateNone,
    
    /** 显示正常按钮, 标题为"点击加载更多" */
    SPSearchLoadMoreButtonStateNormal,
    
    /** 显示禁止按钮, 标题为"加载中" */
    SPSearchLoadMoreButtonStateLoading,
    
    SPSearchLoadMoreButtonStateDisable
};




@class SPSearchLoadMoreButton;

@protocol SPSearchLoadMoreButtonDelegate <NSObject>

- (void)loadMoreButtonClick:(SPSearchLoadMoreButton *)loadMoreButton;

@end





@interface SPSearchLoadMoreButton : UIView

@property (nonatomic, assign) SPSearchLoadMoreButtonState state;
@property (nonatomic, assign) id<SPSearchLoadMoreButtonDelegate> delegate;


- (void)startRefresh;
- (void)stopRefresh;

@end
