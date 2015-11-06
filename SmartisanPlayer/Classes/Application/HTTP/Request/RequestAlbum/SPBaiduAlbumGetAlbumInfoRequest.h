//
//  SPBaiduAlbumGetAlbumInfoRequest.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"
#import "SPBaiduAlbumGetAlbumInfoRespond.h"

typedef void(^AlbumInfoBlock)(SPBaiduAlbumGetAlbumInfoRespond *respond);

@interface SPBaiduAlbumGetAlbumInfoRequest : SPBaiduRequest

+ (void)albumGetAlbumInfoWithAlbumID:(NSString *)albumID completed:(AlbumInfoBlock)completed;

@end
