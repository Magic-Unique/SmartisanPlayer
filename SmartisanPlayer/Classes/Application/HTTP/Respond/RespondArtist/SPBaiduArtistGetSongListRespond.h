//
//  SPBaiduArtistGetSongListRespond.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@interface SPBaiduArtistGetSongListRespond : SPBaiduRespond

@property (nonatomic, copy) NSString *songnums;

@property (nonatomic, strong) NSArray *songlist;

@end



@interface SPBaiduArtistGetSongListSong : NSObject

//    korean_bb_song = "0",
@property (nonatomic, copy) NSString *korean_bb_song;
//    author = "王菲",
@property (nonatomic, copy) NSString *author;
//    pic_big = "",
@property (nonatomic, copy) NSString *pic_big;
//    charge = 0,
@property (nonatomic, assign) BOOL charge;
//    country = "港台",
@property (nonatomic, copy) NSString *country;
//    piao_id = "0",
@property (nonatomic, copy) NSString *piao_id;
//    resource_type_ext = "2",
@property (nonatomic, copy) NSString *resource_type_ext;
//    havehigh = 2,
@property (nonatomic, strong) NSNumber *havehigh;
//    lrclink = "http://musicdata.baidu.com/data2/lrc/239095240/%E4%BC%A0%E5%A5%87.lrc",
@property (nonatomic, copy) NSString *liclink;
//    pic_small = "",
@property (nonatomic, copy) NSString *pic_small;
//    hot = "68036",
@property (nonatomic, copy) NSString *hot;
//    has_mv = 1,
@property (nonatomic, assign) BOOL has_mv;
//    song_source = "web",
@property (nonatomic, copy) NSString *song_source;
//    all_artist_ting_uid = "45561",
@property (nonatomic, copy) NSString *all_artist_ting_uid;
//    publishtime = "2010-02-13",
@property (nonatomic, copy) NSString *publishtime;
//    file_duration = "296",
@property (nonatomic, copy) NSString *file_duration;
//    toneid = "600902000008308667",
@property (nonatomic, copy) NSString *toneid;
//    artist_id = "15",
@property (nonatomic, copy) NSString *artist_id;
//    area = "1",
@property (nonatomic, copy) NSString *area;
//    album_id = "0",
@property (nonatomic, copy) NSString *album_id;
//    learn = 0,
@property (nonatomic, strong) NSNumber *learn;
//    album_title = "",
@property (nonatomic, copy) NSString *album_title;
//    del_status = "0",
@property (nonatomic, copy) NSString *del_status;
//    album_no = "0",
@property (nonatomic, copy) NSString *album_no;
//    has_mv_mobile = 1,
@property (nonatomic, assign) BOOL has_mv_mobile;
//    song_id = "10405520",
@property (nonatomic, copy) NSString *song_id;
//    resource_type = "0",
@property (nonatomic, copy) NSString *resource_type;
//    is_first_publish = 0,
@property (nonatomic, assign) BOOL is_first_publish;
//    all_rate = "24,64,128,192,256,320,flac",
@property (nonatomic, copy) NSString *all_rate;
//    ting_uid = "45561",
@property (nonatomic, copy) NSString *ting_uid;
//    all_artist_id = "15",
@property (nonatomic, copy) NSString *all_artist_id;
//    title = "传奇",
@property (nonatomic, copy) NSString *title;
//    language = "国语",
@property (nonatomic, copy) NSString *language;
//    versions = "",
@property (nonatomic, copy) NSString *versions;
//    copy_type = "1",
//@property (nonatomic, copy) NSString *copy_type;
//    listen_total = "8207",
@property (nonatomic, copy) NSString *listen_total;
//    relate_status = "1"
@property (nonatomic, copy) NSString *relate_status;


@end


