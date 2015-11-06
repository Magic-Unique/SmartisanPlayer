//
//  SPBaiduSearchHotRequest.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"
#import "SPBaiduSearchHotRespond.h"

typedef void(^SearchHotBlock)(SPBaiduSearchHotRespond *respond);

@interface SPBaiduSearchHotRequest : SPBaiduRequest

+ (void)searchHotForCount:(NSUInteger)count completed:(SearchHotBlock)completed;

@end
