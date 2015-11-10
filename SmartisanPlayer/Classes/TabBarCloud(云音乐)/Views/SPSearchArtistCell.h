//
//  SPSearchArtistCell.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPBaiduSearchMergeSong;

@interface SPSearchArtistCell : UITableViewCell

@property (nonatomic, weak) SPBaiduSearchMergeSong *artist;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
