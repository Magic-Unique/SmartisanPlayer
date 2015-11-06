//
//  SPSearchBar.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/19.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTopView.h"

@class SPSearchBar;

@protocol SPSearchBarDelegate <NSObject>

- (void)searchBarPressReturnWithText:(NSString *)text;

@end







@interface SPSearchBar : SPTopView

@property (nonatomic, assign) id<SPSearchBarDelegate> delegate;


- (void)textFieldResignFirstResponder;

- (void)showHotSearch:(NSArray *)list withKeyboardUserInfo:(NSDictionary *)userInfo;

@end
