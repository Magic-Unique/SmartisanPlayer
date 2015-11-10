//
//  SPSearchSongCell.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPSearchSongCell.h"

#import "SPBaiduSearchMergeRequest.h"

#import "UIImageView+WebCache.h"

@implementation SPSearchSongCell


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = APP_COLOR_MAIN_TITLE;
        self.detailTextLabel.textColor = APP_COLOR_CONTENT;
        UIButton *button = [UIButton new];
        button.imageForDeselectNormal = [UIImage imageNamed:@"btn_download"];
        button.imageForDeselectHighlighted = [UIImage imageNamed:@"btn_download_down"];
        [button sizeToFit];
        [button addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = button;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.accessoryView.toSuperViewRight = 0;
}

- (void)downloadClick {
    if ([self.delegate respondsToSelector:@selector(songCellDidClickDownloadButton:)]) {
        [self.delegate songCellDidClickDownloadButton:self];
    }
}

- (void)setSong:(SPBaiduSearchMergeSong *)song {
    _song = song;
    self.textLabel.text = song.title;
    self.detailTextLabel.text = song.author;
}

@end
