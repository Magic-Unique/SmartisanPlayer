//
//  SPSearchSongCell.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPBaiduSearchMergeSong, SPSearchSongCell;

@protocol SPSearchSongCellDelegate <NSObject>

@optional

- (void)songCellDidClickDownloadButton:(SPSearchSongCell *)cell;

@end




@interface SPSearchSongCell : UITableViewCell

@property (nonatomic, weak) SPBaiduSearchMergeSong *song;

@property (nonatomic, assign) id<SPSearchSongCellDelegate> delegate;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;


@end
