//
//  SPBaiduSearchHotRequest.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduSearchHotRequest.h"

@implementation SPBaiduSearchHotRequest

+ (void)searchHotForCount:(NSUInteger)count completed:(SearchHotBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodSearchHot];
    parame[@"page_num"] = @(count);
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduSearchHotItem" forKeyName:@"result"];
            SPRunBlockWithPara(completed, [SPBaiduSearchHotRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
