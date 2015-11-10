//
//  SPSearchSegmentView.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTopView.h"

typedef NS_ENUM(NSUInteger, SPSearchSegmentIndex) {
    SPSearchSegmentIndexSong,
    SPSearchSegmentIndexArtist,
    SPSearchSegmentIndexAlbum,
};


@class SPSearchSegmentView;

@protocol SPSearchSegmentViewDelegate <NSObject>

@optional

/**
 *  选中下标被用户改变
 *
 *  @param segmentView 视图
 */
- (void)segmentViewSelectedIndexDidChange:(SPSearchSegmentView *)segmentView;

@end


@interface SPSearchSegmentView : SPTopView

/** 选中下标 */
@property (nonatomic, assign) SPSearchSegmentIndex selectedIndex;

/** 视图代理 */
@property (nonatomic, assign) id<SPSearchSegmentViewDelegate> delegate;

@end
