//
//  SPSongInfoRespond.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@class SPBaiduDownloadData;

@interface SPBaiduDownloadRespond : SPBaiduRespond

@property (nonatomic, strong) SPBaiduDownloadData *data;

@end





@interface SPBaiduDownloadData : SPBaiduRespond

@property (nonatomic, copy) NSString *xcode;

@property (nonatomic, strong) NSArray *songList;

@end



@interface SPBaiduDownloadSong : NSObject

@property (nonatomic, copy) NSString *queryId;
/** 音乐id */
@property (nonatomic, assign) NSUInteger songId;
/** 音乐名称 */
@property (nonatomic, copy) NSString *songName;
/** 艺术家id */
@property (nonatomic, copy) NSString *artistId;
/** 艺术家名称 */
@property (nonatomic, copy) NSString *artistName;
/** 专辑id */
@property (nonatomic, assign) NSUInteger albumId;
/** 专辑名称 */
@property (nonatomic, copy) NSString *albumName;
/** 90*90 */
@property (nonatomic, copy) NSString *songPicSmall;
/** 150*150 */
@property (nonatomic, copy) NSString *songPicBig;
/** 300*300 */
@property (nonatomic, copy) NSString *songPicRadio;
/** http://music.baidu.com作为前缀的lrc下载地址 */
@property (nonatomic, copy) NSString *lrcLink;

@property (nonatomic, assign) NSInteger copyType;
/** 持续时间 */
@property (nonatomic, assign) NSTimeInterval time;

@property (nonatomic, assign) NSInteger linkCode;
/** 音乐地址 */
@property (nonatomic, copy) NSString *songLink;
/** 百度云地址 */
@property (nonatomic, copy) NSString *showLink;
/** 文件格式 */
@property (nonatomic, copy) NSString *format;

@property (nonatomic, assign) NSInteger rate;

@property (nonatomic, assign) NSUInteger size;

@property (nonatomic, copy) NSString *relateStatus;

@property (nonatomic, copy) NSString *source;

@end
