//
//  SPBaiduArtistGetAlbumListRequest.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"
#import "SPBaiduArtistGetAlbumListRespond.h"

typedef void(^AlbumListBlock)(SPBaiduArtistGetAlbumListRespond *respond);

@interface SPBaiduArtistGetAlbumListRequest : SPBaiduRequest

+ (void)artistAlbumListWithTingUID:(NSString *)tingUID
                         andOffset:(NSUInteger)offset
                         completed:(AlbumListBlock)completed;

@end
