//
//  SPCloudCell.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPCloudCell.h"

@implementation SPCloudCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow3"]];
        self.backgroundView = [[UIImageView alloc] init];
        self.selectedBackgroundView = [[UIImageView alloc] init];
        self.backgroundColor = [UIColor clearColor];
        self.textLabel.font = [UIFont systemFontOfSize:17];
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        ((UIImageView *)self.accessoryView).image = [UIImage imageNamed:@"arrow3_down"];
        self.textLabel.textColor = [UIColor whiteColor];
    } else {
        ((UIImageView *)self.accessoryView).image = [UIImage imageNamed:@"arrow3"];
        self.textLabel.textColor = [UIColor darkGrayColor];
    }
}

@end
