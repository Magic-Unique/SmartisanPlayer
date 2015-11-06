//
//  SPBaiduArtistGetListRequest.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"

#import "SPBaiduArtistGetListRespond.h"

typedef void(^ListBlock)(SPBaiduArtistGetListRespond *respond);

@interface SPBaiduArtistGetListRequest : SPBaiduRequest

+ (void)artistListWithArtistType:(NSDictionary *)artistType offset:(NSUInteger)offset completed:(ListBlock)completed;

@end
