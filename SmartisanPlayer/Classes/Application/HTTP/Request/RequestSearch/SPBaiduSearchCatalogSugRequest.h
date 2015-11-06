//
//  SPBaiduSearchCatalogSugRequest.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"

#import "SPBaiduSearchCatalogSugRespond.h"

typedef void(^SearchCatalogSugBlock)(SPBaiduSearchCatalogSugRespond *respond);

@interface SPBaiduSearchCatalogSugRequest : SPBaiduRequest

+ (void)searchCatalogSugWithQuery:(NSString *)query completed:(SearchCatalogSugBlock)completed;

@end
