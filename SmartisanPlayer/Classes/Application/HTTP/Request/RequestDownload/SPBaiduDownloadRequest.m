//
//  SPBaiduDownloadRequest.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduDownloadRequest.h"

@implementation SPBaiduDownloadRequest

+ (void)downloadInfoForSongId:(NSString *)songId completed:(DownloadBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodSongDownWeb];
    parame[@"songids"] = songId;
    [self GET:BDURLDownload parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduDownloadSong" forKeyName:@"songList"];
            SPRunBlockWithPara(completed, [SPBaiduDownloadRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
