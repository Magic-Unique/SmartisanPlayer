//
//  SPSearchAlbumCell.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPSearchAlbumCell.h"

#import "SPBaiduSearchMergeRequest.h"

#import "UIImage+Extension.h"
#import "UIImageView+WebCache.h"

#define placeholder [UIImage imageWithColor:APP_COLOR_CONTENT andSize:CGSizeMake(30, 30)]
#define margin 3

@implementation SPSearchAlbumCell

- (void)setAlbum:(SPBaiduSearchCatalogSugAlbum *)album {
    _album = album;
    self.textLabel.text = album.albumname;
    self.detailTextLabel.text = album.artistname;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:album.artistpic] placeholderImage:placeholder];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = APP_COLOR_MAIN_TITLE;
        self.detailTextLabel.textColor = APP_COLOR_CONTENT;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.side = self.height - 2 * margin;
    self.imageView.midY = self.midPoint.y;
}

@end
