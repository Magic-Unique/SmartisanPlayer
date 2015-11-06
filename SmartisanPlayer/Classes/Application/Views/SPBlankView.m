//
//  SPBlankView.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/18.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPBlankView.h"

@interface SPBlankView ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *messageLabel;

@end

@implementation SPBlankView

+ (instancetype)viewForPlayLists {
    SPBlankView *view = [SPBlankView new];
    view.image = [UIImage imageNamed:@"blank_playlist"];
    view.title = @"暂无播放列表";
    view.message = @"可以在此创建自己的播放列表";
    return view;
}
+ (instancetype)viewForAlbums {
    SPBlankView *view = [SPBlankView new];
    view.image = [UIImage imageNamed:@"blank_album"];
    view.title = @"暂无专辑";
    view.message = @"本地歌曲所属的专辑将显示在这里";
    return view;
}
+ (instancetype)viewForArtists {
    SPBlankView *view = [SPBlankView new];
    view.image = [UIImage imageNamed:@"blank_artist"];
    view.title = @"暂无艺术家";
    view.message = @"本地歌曲的表演艺术家将显示在这里";
    return view;
}
+ (instancetype)viewForSongs {
    SPBlankView *view = [SPBlankView new];
    view.image = [UIImage imageNamed:@"blank_song"];
    view.title = @"暂无歌曲";
    view.message = @"本地歌曲将显示在这里";
    return view;
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message {
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
        self.message = message;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.side = MIN(self.width, self.height) / 3;
    _imageView.center = self.midPoint;
    _imageView.midY -= 50;
    
    [_titleLabel sizeToFit];
    _titleLabel.midX = self.midPoint.x;
    _titleLabel.minY = _imageView.maxY + 30;
    
    [_messageLabel sizeToFit];
    _messageLabel.midX = self.midPoint.x;
    _messageLabel.minY = _titleLabel.maxY + 15;
}

- (void)setImage:(UIImage *)image {
    if (image) {
        self.imageView.image = image;
    } else {
        _imageView.image = nil;
    }
    [self setNeedsLayout];
}

- (UIImage *)image {
    return _imageView.image;
}

- (void)setTitle:(NSString *)title {
    if (title) {
        self.titleLabel.text = title;
    } else {
        _titleLabel.text = nil;
    }
    [self setNeedsLayout];
}

- (NSString *)title {
    return _titleLabel.text;
}

- (void)setMessage:(NSString *)message {
    if (message) {
        self.messageLabel.text = message;
    } else {
        _messageLabel.text = nil;
    }
    [self setNeedsLayout];
}

- (NSString *)message {
    return _messageLabel.text;
}

#pragma mark - view lazy load

- (UIImageView *)imageView {
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont boldSystemFontOfSize:25];
        titleLabel.textColor = [UIColor colorWithWhite:0.804 alpha:1.000];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.font = [UIFont systemFontOfSize:13];
        messageLabel.textColor = [UIColor colorWithWhite:0.804 alpha:1.000];
        [self addSubview:messageLabel];
        _messageLabel = messageLabel;
    }
    return _messageLabel;
}

@end
