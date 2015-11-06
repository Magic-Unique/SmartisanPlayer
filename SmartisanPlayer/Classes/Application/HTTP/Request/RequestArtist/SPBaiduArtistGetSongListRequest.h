//
//  SPBaiduArtistGetSongList.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"
#import "SPBaiduArtistGetSongListRespond.h"

typedef void(^SongListBlock)(SPBaiduArtistGetSongListRespond *respond);

@interface SPBaiduArtistGetSongListRequest : SPBaiduRequest

+ (void)artistSongListWithTingUID:(NSString *)tingUID
                           offset:(NSUInteger)offset
                        completed:(SongListBlock)completed;

@end
