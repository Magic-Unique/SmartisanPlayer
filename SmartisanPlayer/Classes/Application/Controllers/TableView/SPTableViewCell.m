//
//  SPTableViewCell.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/26.
//  Copyright © 2015年 Unique. All rights reserved.
//

#import "SPTableViewCell.h"

#define margin 5

@implementation SPTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = APP_COLOR_MAIN_TITLE;
        self.detailTextLabel.textColor = APP_COLOR_SUB_TITLE;
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
//    self.imageView.side = self.height - 2 * margin;
//    self.imageView.midY = self.midPoint.y;
    CGFloat m = self.height - self.textLabel.height - self.detailTextLabel.height;
    m /= 3;
    self.textLabel.toSuperViewTop = m;
    self.detailTextLabel.toSuperViewBottom = m;
}

@end
