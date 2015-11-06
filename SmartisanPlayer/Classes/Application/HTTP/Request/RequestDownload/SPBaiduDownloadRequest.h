//
//  SPBaiduDownloadRequest.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"
#import "SPBaiduDownloadRespond.h"

typedef void(^DownloadBlock)(SPBaiduDownloadRespond *respond);

@interface SPBaiduDownloadRequest : SPBaiduRequest

+ (void)downloadInfoForSongId:(NSString *)songId completed:(DownloadBlock)completed;

@end
