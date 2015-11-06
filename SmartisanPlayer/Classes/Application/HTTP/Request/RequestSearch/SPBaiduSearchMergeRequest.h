//
//  SPBaiduSearchMerge.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"
#import "SPBaiduSearchMergeRespond.h"

typedef void(^SearchMergeBlock)(SPBaiduSearchMergeRespond *respond);

@interface SPBaiduSearchMergeRequest : SPBaiduRequest

+ (void)searchMergeWithQuery:(NSString *)query
                  pageNumber:(NSUInteger)pageNumber
                    pageSize:(NSUInteger)pageSize
                   completed:(SearchMergeBlock)completed;

@end
