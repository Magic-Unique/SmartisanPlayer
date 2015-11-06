//
//  SPSourceView.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/29.
//  Copyright © 2015年 Unique. All rights reserved.
//

#import "SPSourceView.h"

#define margin 5
#define CONST_FRAME_DEFAULT     CGRectMake(0, 0, Screen_Width, 30)

@interface SPSourceView ()

{
    NSString *_title;
}

@property (nonatomic, weak) UIImageView *cloudImage;
@property (nonatomic, weak) UILabel *cloudLabel;

@end

@implementation SPSourceView

- (instancetype)initWithTitle:(NSString *)title {
    self = [super initWithFrame:CONST_FRAME_DEFAULT];
    if (self) {
        _title = title;
    }
    return self;
}

- (instancetype)init {
    self = [super initWithFrame:CONST_FRAME_DEFAULT];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    //先设置图标的y坐标
    self.cloudImage.minY = margin;
    //再设置Label与图标水平中心对齐
    self.cloudLabel.midY = self.cloudImage.midY;
    //将Label居中
    self.cloudLabel.midX = self.midPoint.x;
    //将Label向右偏移一点
    self.cloudLabel.midX += self.cloudImage.width;
    //根据Label设置图标的x坐标
    self.cloudImage.maxX = self.cloudLabel.minX - 10;
}

- (UIImageView *)cloudImage
{
    if (!_cloudImage) {
        UIImageView *cloudImage = [[UIImageView alloc] init];
        cloudImage.image = [UIImage imageNamed:@"yun_logo"];
        [cloudImage sizeToFit];
        [self addSubview:cloudImage];
        _cloudImage = cloudImage;
    }
    return _cloudImage;
}

- (UILabel *)cloudLabel
{
    if (!_cloudLabel) {
        UILabel *cloudLabel = [[UILabel alloc] init];
        cloudLabel.text = _title ? _title : @"";
        cloudLabel.font = [UIFont systemFontOfSize:12];
        cloudLabel.textColor = [UIColor colorWithRed:0.780 green:0.784 blue:0.788 alpha:1.000];
        [cloudLabel sizeToFit];
        [self addSubview:cloudLabel];
        _cloudLabel = cloudLabel;
    }
    return _cloudLabel;
}


@end
