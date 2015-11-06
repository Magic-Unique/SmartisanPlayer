//
//  SPBaiduArtistGetAlbumListRespond.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@interface SPBaiduArtistGetAlbumListRespond : SPBaiduRespond

@property (nonatomic, copy) NSString *albumnums;

@property (nonatomic, strong) NSArray *albumlist;

@end


@interface SPBaiduArtistGetAlbumListAlbum : NSObject

@property (nonatomic, copy) NSString *prodcompany;

@property (nonatomic, copy) NSString *publishcompany;

@property (nonatomic, copy) NSString *language;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *all_artist_id;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *pic_big;

@property (nonatomic, copy) NSString *recommend_num;

@property (nonatomic, copy) NSString *styles;

@property (nonatomic, copy) NSString *hot;

@property (nonatomic, copy) NSString *pic_radio;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *favorites_num;

@property (nonatomic, copy) NSString *songs_total;

@property (nonatomic, copy) NSString *style_id;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *pic_s180;

@property (nonatomic, copy) NSString *pic_small;

@property (nonatomic, copy) NSString *all_artist_ting_uid;

@property (nonatomic, copy) NSString *artist_id;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *artist_ting_uid;

@property (nonatomic, copy) NSString *album_id;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *publishtime;

@end
