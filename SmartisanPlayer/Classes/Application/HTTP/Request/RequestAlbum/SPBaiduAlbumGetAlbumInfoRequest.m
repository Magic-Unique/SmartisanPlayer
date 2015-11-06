//
//  SPBaiduAlbumGetAlbumInfoRequest.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduAlbumGetAlbumInfoRequest.h"

@implementation SPBaiduAlbumGetAlbumInfoRequest

+ (void)albumGetAlbumInfoWithAlbumID:(NSString *)albumID completed:(AlbumInfoBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodAlbumGetAlbumInfo];
    parame[@"album_id"] = albumID;
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduAlbumGetAlbumInfoSong" forKeyName:@"songlist"];
            SPRunBlockWithPara(completed, [SPBaiduAlbumGetAlbumInfoRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
