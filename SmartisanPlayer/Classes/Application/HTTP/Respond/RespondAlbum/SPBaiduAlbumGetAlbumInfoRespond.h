//
//  SPBaiduAlbumGetAlbumInfoRespond.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@class SPBaiduAlbumGetAlbumInfoAlbum, SPBaiduAlbumGetAlbumInfoSong;

@interface SPBaiduAlbumGetAlbumInfoRespond : SPBaiduRespond

@property (nonatomic, strong) SPBaiduAlbumGetAlbumInfoAlbum *albumInfo;

@property (nonatomic, strong) NSArray *songlist;

@end





@interface SPBaiduAlbumGetAlbumInfoSong : NSObject

//    korean_bb_song = "0",
@property (nonatomic, copy) NSString *korean_bb_song;
//    author = "王菲",
@property (nonatomic, copy) NSString *author;
//    pic_big = "http://musicdata.baidu.com/data2/pic/247078212/247078212.jpg",
@property (nonatomic, copy) NSString *pic_big;
//    charge = 0,
@property (nonatomic, assign) BOOL charge;
//    country = "港台",
@property (nonatomic, copy) NSString *country;
//    piao_id = "0",
@property (nonatomic, copy) NSString *piao_id;
//    resource_type_ext = "0",
@property (nonatomic, copy) NSString *resource_type_ext;
//    havehigh = 2,
@property (nonatomic, strong) NSNumber *havehigh;
//    hot = "742926",
@property (nonatomic, copy) NSString *hot;
//    pic_small = "http://musicdata.baidu.com/data2/pic/247078215/247078215.jpg",
@property (nonatomic, copy) NSString *pic_small;
//    lrclink = "http://musicdata.baidu.com/data2/lrc/247089471/%E6%B8%85%E9%A3%8E%E5%BE%90%E6%9D%A5.lrc",
@property (nonatomic, copy) NSString *lrclink;
//    has_mv = 0,
@property (nonatomic, assign) BOOL has_mv;
//    song_source = "web",
@property (nonatomic, copy) NSString *song_source;
//    all_artist_ting_uid = "45561",
@property (nonatomic, copy) NSString *all_artist_ting_uid;
//    publishtime = "2015-09-10",
@property (nonatomic, copy) NSString *publishtime;
//    file_duration = "285",
@property (nonatomic, copy) NSString *file_duration;
//    toneid = "0",
@property (nonatomic, copy) NSString *toneid;
//    artist_id = "15",
@property (nonatomic, copy) NSString *artist_id;
//    area = "1",
@property (nonatomic, copy) NSString *area;
//    album_id = "247079804",
@property (nonatomic, copy) NSString *album_id;
//    learn = 0,
@property (nonatomic, assign) BOOL learn;
//    album_title = "清风徐来",
@property (nonatomic, copy) NSString *album_title;
//    del_status = "0",
@property (nonatomic, copy) NSString *del_status;
//    album_no = "1",
@property (nonatomic, copy) NSString *album_no;
//    has_mv_mobile = 0,
@property (nonatomic, assign) BOOL has_mv_mobile;
//    song_id = "247079803",
@property (nonatomic, copy) NSString *song_id;
//    resource_type = "0",
@property (nonatomic, copy) NSString *resource_type;
//    is_first_publish = 0,
@property (nonatomic, assign) BOOL is_first_publish;
//    all_rate = "flac,320,256,192,128,64,24",
@property (nonatomic, copy) NSString *all_rate;
//    ting_uid = "45561",
@property (nonatomic, copy) NSString *ting_uid;
//    all_artist_id = "15",
@property (nonatomic, copy) NSString *all_artist_id;
//    title = "清风徐来",
@property (nonatomic, copy) NSString *title;
//    language = "国语",
@property (nonatomic, copy) NSString *language;
//    versions = "",
@property (nonatomic, copy) NSString *versions;
//    copy_type = "1"
//@property (nonatomic, copy) NSString *copy_type;


@end






@interface SPBaiduAlbumGetAlbumInfoAlbum : NSObject

//    prodcompany = "",
@property (nonatomic, copy) NSString *prodcompany;
//    publishcompany = "KATIE CHAN PRODUCTIONS CO.LTD",
@property (nonatomic, copy) NSString *publishcompany;
//    language = "国语",
@property (nonatomic, copy) NSString *language;
//    title = "清风徐来",
@property (nonatomic, copy) NSString *title;
//    all_artist_id = "15",
@property (nonatomic, copy) NSString *all_artist_id;
//    country = "港台",
@property (nonatomic, copy) NSString *country;
//    pic_big = "http://musicdata.baidu.com/data2/pic/247078212/247078212.jpg",
@property (nonatomic, copy) NSString *pic_big;
//    pic_s1000 = "http://musicdata.baidu.com/data2/pic/247079805/247079805.jpg",
@property (nonatomic, copy) NSString *pic_s1000;
//    recommend_num = <null>,
@property (nonatomic, copy) NSString *recommend_num;
//    styles = "影视原声",
@property (nonatomic, copy) NSString *styles;
//    hot = "",
@property (nonatomic, copy) NSString *hot;
//    pic_radio = "http://musicdata.baidu.com/data2/pic/247078209/247078209.jpg",
@property (nonatomic, copy) NSString *pic_radio;
//    info = "《港囧》徐峥赵薇杜鹃深陷红...在囧途”。",
@property (nonatomic, copy) NSString *info;
//    favorites_num = <null>,
@property (nonatomic, copy) NSString *favorites_num;
//    songs_total = "1",
@property (nonatomic, copy) NSString *songs_total;
//    style_id = "2",
@property (nonatomic, copy) NSString *style_id;
//    gender = "1",
@property (nonatomic, copy) NSString *gender;
//    pic_small = "http://musicdata.baidu.com/data2/pic/247078215/247078215.jpg",
@property (nonatomic, copy) NSString *pic_small;
//    all_artist_ting_uid = <null>,
@property (nonatomic, copy) NSString *all_artist_ting_uid;
//    artist_id = "15",
@property (nonatomic, copy) NSString *artist_id;
//    area = "1",
@property (nonatomic, copy) NSString *area;
//    pic_s500 = "http://musicdata.baidu.com/data2/pic/247079806/247079806.jpg",
@property (nonatomic, copy) NSString *pic_s500;
//    artist_ting_uid = "45561",
@property (nonatomic, copy) NSString *artist_ting_uid;
//    album_id = "247079804",
@property (nonatomic, copy) NSString *album_id;
//    author = "王菲",
@property (nonatomic, copy) NSString *author;
//    publishtime = "2015-09-10"
@property (nonatomic, copy) NSString *publishtime;

@end