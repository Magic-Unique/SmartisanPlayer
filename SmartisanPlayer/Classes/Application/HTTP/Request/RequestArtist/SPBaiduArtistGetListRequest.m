//
//  SPBaiduArtistGetListRequest.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduArtistGetListRequest.h"

@implementation SPBaiduArtistGetListRequest

+ (void)artistListWithArtistType:(NSDictionary *)artistType offset:(NSUInteger)offset completed:(ListBlock)completed {
    NSDictionary *range  = [NSMutableDictionary dictionaryWithOffset:@(offset) limit:0 order:BDOrderHot];
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodArtistList];
    [parame setBDArtistType:artistType];
    [parame setBDRange:range];
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduArtistGetListArtist" forKeyName:@"artist"];
            SPRunBlockWithPara(completed, [SPBaiduArtistGetListRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
