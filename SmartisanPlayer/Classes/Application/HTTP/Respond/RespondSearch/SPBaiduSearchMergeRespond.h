//
//  SPBaiduSearchMergeRespond.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@class SPBaiduSearchMergeResult, SPBaiduSearchMergeSongInfo;

@interface SPBaiduSearchMergeRespond : SPBaiduRespond

@property (nonatomic, strong) SPBaiduSearchMergeResult *result;

@end






@interface SPBaiduSearchMergeResult : NSObject

@property (nonatomic, strong) NSNumber *rqt_type;

@property (nonatomic, copy) NSString *query;

@property (nonatomic, copy) NSString *syn_words;

@property (nonatomic, strong) SPBaiduSearchMergeSongInfo *song_info;

@end



@interface SPBaiduSearchMergeSongInfo : NSObject

@property (nonatomic, strong) NSNumber *total;

@property (nonatomic, strong) NSArray *song_list;

@end







@interface SPBaiduSearchMergeSong : NSObject
//    all_rate = "128,320,24,256,64,192",
@property (nonatomic, copy) NSString *all_rate;
//    author = "林志炫",
@property (nonatomic, copy) NSString *author;
//    piao_id = "0",
@property (nonatomic, copy) NSString *piao_id;
//    all_artist_id = "313",
@property (nonatomic, copy) NSString *all_artist_id;
//    title = "烟花易冷",
@property (nonatomic, copy) NSString *title;
//    learn = 1,
@property (nonatomic, assign) BOOL learn;
//    is_first_publish = 0,
@property (nonatomic, assign) BOOL is_first_publish;
//    toneid = "600902000009572901",
@property (nonatomic, copy) NSString *toneid;
//    has_mv = 1,
@property (nonatomic, assign) BOOL has_mv;
//    korean_bb_song = "0",
@property (nonatomic, copy) NSString *korean_bb_song;
//    resource_type = 2,
@property (nonatomic, strong) NSNumber *resource_type;
//    relate_status = 0,
@property (nonatomic, strong) NSNumber *relate_status;
//    song_id = "34303121",
@property (nonatomic, copy) NSString *song_id;
//    info = "综艺节目《我是歌手》第一季第六期",
@property (nonatomic, copy) NSString *info;
//    album_title = "我是歌手 第六期",
@property (nonatomic, copy) NSString *album_title;
//    resource_type_ext = "0",
@property (nonatomic, copy) NSString *resource_type_ext;
//    lrclink = "http://musicdata.baidu.com/data2/lrc/133155128/%E7%83%9F%E8%8A%B1%E6%98%93%E5%86%B7.lrc",
@property (nonatomic, copy) NSString *lrclink;
//    has_mv_mobile = 1,
@property (nonatomic, assign) BOOL has_mv_mobile;
//    artist_id = "313",
@property (nonatomic, copy) NSString *artist_id;
//    ting_uid = "83561",
@property (nonatomic, copy) NSString *ting_uid;
//    cluster_id = 0,
@property (nonatomic, strong) NSNumber *cluster_id;
//    havehigh = 2,
@property (nonatomic, strong) NSNumber *havehigh;
//    song_source = "web",
@property (nonatomic, copy) NSString *song_source;
//    charge = 0,
@property (nonatomic, assign) BOOL charge;
//    data_source = 0,
@property (nonatomic, strong) NSNumber *data_source;
//    album_id = "34300154",
@property (nonatomic, copy) NSString *album_id;
//    content = "",
@property (nonatomic, copy) NSString *content;
//    copy_type = "1"
//@property (nonatomic, copy) NSString *copy_type;
@end
