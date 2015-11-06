//
//  SPBaiduSearchMerge.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduSearchMergeRequest.h"

@implementation SPBaiduSearchMergeRequest

+ (void)searchMergeWithQuery:(NSString *)query
                  pageNumber:(NSUInteger)pageNumber
                    pageSize:(NSUInteger)pageSize
                   completed:(SearchMergeBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodSearchMerge];
    parame[@"query"] = query;
    parame[@"page_no"] = @(pageNumber);
    parame[@"page_size"] = @(pageSize);
    parame[@"type"] = @(-1);
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduSearchMergeSong" forKeyName:@"song_list"];
            SPRunBlockWithPara(completed, [SPBaiduSearchMergeRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
