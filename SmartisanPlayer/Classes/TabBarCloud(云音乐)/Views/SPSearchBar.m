//
//  SPSearchBar.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/19.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPSearchBar.h"

#define margin 5
#define place 35

@interface SPSearchBar () <UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) NSArray *line1forHotSearchButtons;
@property (nonatomic, strong) NSArray *line2forHotSearchButtons;

@end

@implementation SPSearchBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.background];
        [self.background addSubview:self.textField];
        [self addSubview:self.cancelButton];
        [self addButton];
    }
    return self;
}

- (void)addButton {
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 3; i++) {
        UIButton *button = [self button];
        [self addSubview:button];
        [list addObject:button];
    }
    self.line1forHotSearchButtons = [list copy];
    list = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 3; i++) {
        UIButton *button = [self button];
        [self addSubview:button];
        [list addObject:button];
    }
    self.line2forHotSearchButtons = [list copy];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.background.frame = [self frameForBackgroundInEditing:self.textField.isFirstResponder];
    self.textField.frame = [self frameForTextFieldInEditing:self.textField.isFirstResponder];
    self.cancelButton.frame = [self frameForCancelButtonInEditing:self.textField.isFirstResponder];
    
    for (int i = 0; i < self.line1forHotSearchButtons.count; i++) {
        UIButton *button = self.line1forHotSearchButtons[i];
        button.frame = [self frameForHotSearchButtonInLine:0 row:i];
    }
    for (int i = 0; i < self.line2forHotSearchButtons.count; i++) {
        UIButton *button = self.line2forHotSearchButtons[i];
        button.frame = [self frameForHotSearchButtonInLine:1 row:i];
    }
    
}

- (void)textFieldResignFirstResponder {
    [self.textField resignFirstResponder];
}

- (void)showHotSearch:(NSArray *)list withKeyboardUserInfo:(NSDictionary *)userInfo {
//    if (self.textField.isEditing) {
//        NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//        UIViewAnimationOptions options = [userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
//        
//        for (int i = 0; i < self.line1forHotSearchButtons.count; i++) {
//            UIButton *button = self.line1forHotSearchButtons[i];
//            button.hidden = NO;
//            SPBaiduSearchHotItem *item = list[i];
//            button.titleForDeselectNormal = item.word;
//        }
//        for (int i = 0; i < self.line2forHotSearchButtons.count; i++) {
//            UIButton *button = self.line2forHotSearchButtons[i];
//            button.hidden = NO;
//            SPBaiduSearchHotItem *item = list[3+i];
//            button.titleForDeselectNormal = item.word;
//        }
//        
//        [UIView animateWithDuration:duration delay:0 options:options animations:^{
//            self.frame = [self frameForSelfInEditing:YES];
//        } completion:nil];
//    }
}

#pragma mark - private selector

- (void)cancelButtonClick {
    [self.textField resignFirstResponder];
}

#pragma mark - text field delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self animationForStartEditing];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animationForStopEditing];
}

- (void)animationForStartEditing {
    [UIView animateWithDuration:0.25 animations:^{
        self.background.frame = [self frameForBackgroundInEditing:YES];
        self.textField.frame = [self frameForTextFieldInEditing:YES];
        self.cancelButton.frame = [self frameForCancelButtonInEditing:YES];
    }];
}

- (void)animationForStopEditing {
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = [self frameForSelfInEditing:NO];
        self.background.frame = [self frameForBackgroundInEditing:NO];
        self.textField.frame = [self frameForTextFieldInEditing:NO];
        self.cancelButton.frame = [self frameForCancelButtonInEditing:NO];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(searchBarPressReturnWithText:)] && self.textField.text.length > 0) {
        [self.delegate searchBarPressReturnWithText:self.textField.text];
    }
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - view lazy load

- (UITextField *)textField {
    if (!_textField) {
        UITextField *textField = [[UITextField alloc] init];
        textField.delegate = self;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.returnKeyType = UIReturnKeySearch;
        textField.placeholder = @"支持搜索艺术家, 专辑, 歌曲";
        textField.height = 30;
        textField.font = [UIFont systemFontOfSize:13];
        textField.textColor = APP_COLOR_SUB_TITLE;
        textField.text = @"烟花易冷";
        _textField = textField;
    }
    return _textField;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        UIButton *cancelButton = [[UIButton alloc] init];
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:13];
        cancelButton.titleForDeselectNormal = @"取消";
        cancelButton.titleColorForDeselectNormal = APP_COLOR_SUB_TITLE;
        cancelButton.titleColorForDeselectHighlighted = APP_COLOR_HIGHLIGHTED;
        cancelButton.backgroundImageForDeselectNormal = [UIImage imageNamed:@"btn_cancel.9"];
        cancelButton.backgroundImageForDeselectHighlighted = [UIImage imageNamed:@"btn_cancel_down.9"];
        cancelButton.height = 40;
        cancelButton.width = 50;
        [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
        self.cancelButton = cancelButton;
    }
    return _cancelButton;
}

- (UIImageView *)background {
    if (!_background) {
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.9"]];
        _background.userInteractionEnabled = YES;
    }
    return _background;
}

- (CGRect)frameForHotSearchButtonInLine:(NSUInteger)line row:(NSUInteger)row {
    CGFloat width = (self.width-4 * margin)/ 3;
    CGFloat height = 30;
    CGFloat x = margin * (row + 1) + width * row;
    CGFloat y = 40 + margin * (line + 1) + height * line;
    return CGRectMake(x, y, width, height);
}

- (CGRect)frameForSelfInEditing:(BOOL)editing {
    return CGRectMake(0, 0, self.frame.size.width, editing?40 + margin + 30 + margin + 30 + margin:40);
}

- (CGRect)frameForBackgroundInEditing:(BOOL)editing {
    CGFloat right = editing ? 2 * margin + self.cancelButton.width : margin + 7.5;
    return CGRectMake(7.5 + margin, margin, self.width - 2 *margin - right, 30);
}

- (CGRect)frameForTextFieldInEditing:(BOOL)editing {
    CGRect frameForBackground = [self frameForBackgroundInEditing:editing];
    frameForBackground.origin.y = 0;
    frameForBackground.origin.x = place;
    frameForBackground.size.width -= place + 4;
    return frameForBackground;
}

- (CGRect)frameForCancelButtonInEditing:(BOOL)editing {
    CGRect frame = self.cancelButton.frame;
    CGRect frameForBg = [self frameForBackgroundInEditing:editing];
    frame.origin.y = 0;
    frame.origin.x = frameForBg.origin.x + frameForBg.size.width + margin;
    return frame;
}

- (UIButton *)button {
    UIButton *button = [UIButton new];
    button.hidden = YES;
    button.titleColorForDeselectNormal = APP_COLOR_SUB_TITLE;
    button.titleColorForDeselectHighlighted = APP_COLOR_MAIN_TITLE;
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    return button;
}

@end
