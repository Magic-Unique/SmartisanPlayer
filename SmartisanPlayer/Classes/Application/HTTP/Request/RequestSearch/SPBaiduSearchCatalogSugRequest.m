//
//  SPBaiduSearchCatalogSugRequest.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduSearchCatalogSugRequest.h"

@implementation SPBaiduSearchCatalogSugRequest

+ (void)searchCatalogSugWithQuery:(NSString *)query completed:(SearchCatalogSugBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodSearchCatalogSug];
    parame[@"query"] = query;
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduSearchCatalogSugSong" forKeyName:@"song"];
            [guide setClassName:@"SPBaiduSearchCatalogSugAlbum" forKeyName:@"album"];
            [guide setClassName:@"SPBaiduSearchCatalogSugArtist" forKeyName:@"artist"];
            SPRunBlockWithPara(completed, [SPBaiduSearchCatalogSugRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
