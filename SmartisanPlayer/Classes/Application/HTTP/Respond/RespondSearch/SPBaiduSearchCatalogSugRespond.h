//
//  SPSearchRespond.h
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/4.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPBaiduRespond.h"


@interface SPBaiduSearchCatalogSugRespond : SPBaiduRespond

@property (nonatomic, copy) NSString *order;

@property (nonatomic, strong) NSArray *song;

@property (nonatomic, strong) NSArray *album;

@property (nonatomic, strong) NSArray *artist;

- (NSArray *)orderArray;

@end


@interface SPBaiduSearchCatalogSugAlbum : NSObject

/** 专辑名称 */
@property (nonatomic, copy) NSString *albumname;

/** 专辑图片 */
@property (nonatomic, copy) NSString *artistpic;

/** 专辑id */
@property (nonatomic, copy) NSString *albumid;

/** 艺术家名称 */
@property (nonatomic, copy) NSString *artistname;

@end




@interface SPBaiduSearchCatalogSugArtist : NSObject

@property (nonatomic, copy) NSString *yyr_artist;

/** 艺术家id */
@property (nonatomic, copy) NSString *artistid;

/** 艺术家图片 */
@property (nonatomic, copy) NSString *artistpic;

/** 艺术家名称 */
@property (nonatomic, copy) NSString *artistname;

@end




@interface SPBaiduSearchCatalogSugSong : NSObject

@property (nonatomic, copy) NSString *bitrate_fee;

@property (nonatomic, copy) NSString *yyr_artist;

/** 音乐名称 */
@property (nonatomic, copy) NSString *songname;

/** 艺术家名称 */
@property (nonatomic, copy) NSString *artistname;

@property (nonatomic, copy) NSString *control;

/** 音乐id */
@property (nonatomic, copy) NSString *songid;

/** 是否有mv */
@property (nonatomic, copy) NSString *has_mv;

@property (nonatomic, copy) NSString *encrypted_songid;

@end
