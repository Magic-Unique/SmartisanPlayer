//
//  SPSearchSegmentView.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPSearchSegmentView.h"


static UIImage *imageForLeftNormal;
static UIImage *imageForLeftPress;
static UIImage *imageForMidNormal;
static UIImage *imageForMidPress;
static UIImage *imageForRightNormal;
static UIImage *imageForRightPress;

@interface SPSearchSegmentView ()

@property (nonatomic, strong) UIButton *songButton;

@property (nonatomic, strong) UIButton *artistButton;

@property (nonatomic, strong) UIButton *albumButton;


@end

@implementation SPSearchSegmentView

+ (void)initialize {
    imageForLeftNormal  =   [UIImage imageNamed:@"btn_category_songname"];
    imageForLeftPress   =   [UIImage imageNamed:@"btn_category_songname_down"];
    imageForMidNormal   =   [UIImage imageNamed:@"btn_category_score"];
    imageForMidPress    =   [UIImage imageNamed:@"btn_category_score_down"];
    imageForRightNormal =   [UIImage imageNamed:@"btn_category_views"];
    imageForRightPress  =   [UIImage imageNamed:@"btn_category_views_down"];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.songButton];
        [self addSubview:self.artistButton];
        [self addSubview:self.albumButton];
        self.selectedIndex = SPSearchSegmentIndexSong;
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat midY = self.midPoint.y + 1;
    self.songButton.midY = midY;
    self.albumButton.midY = midY;
    self.artistButton.midY = midY;
    self.artistButton.midX = self.midPoint.x;
    self.songButton.rightView = self.artistButton;
    self.albumButton.leftView = self.artistButton;
    [super layoutSubviews];
}

- (void)setSelectedIndex:(SPSearchSegmentIndex)selectedIndex {
    self.songButton.selected = NO;
    self.artistButton.selected = NO;
    self.albumButton.selected = NO;
    switch (selectedIndex) {
        case SPSearchSegmentIndexSong:
            self.songButton.selected = YES;
            break;
        case SPSearchSegmentIndexAlbum:
            self.albumButton.selected = YES;
            break;
        case SPSearchSegmentIndexArtist:
            self.artistButton.selected = YES;
            break;
        default:
            break;
    }
}

- (SPSearchSegmentIndex)selectedIndex {
    if (self.songButton.isSelected) {
        return SPSearchSegmentIndexSong;
    } else if (self.artistButton.isSelected) {
        return SPSearchSegmentIndexArtist;
    } else {
        return SPSearchSegmentIndexAlbum;
    }
}

- (void)buttonClick:(UIButton *)sender {
    SPSearchSegmentIndex oldIndex = [self selectedIndex];
    self.songButton.selected = NO;
    self.artistButton.selected = NO;
    self.albumButton.selected = NO;
    sender.selected = YES;
    SPSearchSegmentIndex newIndex = [self selectedIndex];
    if (oldIndex != newIndex) {
        if ([self.delegate respondsToSelector:@selector(segmentViewSelectedIndexDidChange:)]) {
            [self.delegate segmentViewSelectedIndexDidChange:self];
        }
    }
}

- (UIButton *)songButton {
    if (!_songButton) {
        _songButton = [self buttonWithTitle:@"歌曲" andNormalImage:imageForLeftNormal highlightedImage:imageForLeftPress];
    }
    return _songButton;
}

- (UIButton *)artistButton {
    if (!_artistButton) {
        _artistButton = [self buttonWithTitle:@"艺术家" andNormalImage:imageForMidNormal highlightedImage:imageForMidPress];
    }
    return _artistButton;
}

- (UIButton *)albumButton {
    if (!_albumButton) {
        _albumButton = [self buttonWithTitle:@"专辑" andNormalImage:imageForRightNormal highlightedImage:imageForRightPress];
    }
    return _albumButton;
}


- (UIButton *)buttonWithTitle:(NSString *)title andNormalImage:(UIImage *)normal highlightedImage:(UIImage *)highlighted {
    UIButton *button = [UIButton new];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.titleForDeselectNormal = title;
    button.titleColorForDeselectNormal      =   APP_COLOR_MAIN_TITLE;
    button.titleColorForDeselectHighlighted =   [UIColor whiteColor];
    button.titleColorForSelectedNormal      =   [UIColor whiteColor];
    button.titleColorForSelectedHighlighted =   [UIColor whiteColor];
    button.backgroundImageForDeselectNormal         =   normal;
    button.backgroundImageForDeselectHighlighted    =   highlighted;
    button.backgroundImageForSelectedNormal         =   highlighted;
    button.backgroundImageForSelectedHighlighted    =   highlighted;
    [button sizeToFit];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}



@end
