//
//  SPBaiduArtistGetSongList.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduArtistGetSongListRequest.h"

@implementation SPBaiduArtistGetSongListRequest

+ (void)artistSongListWithTingUID:(NSString *)tingUID
                           offset:(NSUInteger)offset
                        completed:(SongListBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodArtistGetSongList];
    parame[@"tinguid"] = tingUID;
    parame[@"artistid"] = @"(null)";
    [parame setBDRange:[NSMutableDictionary dictionaryWithOffset:@(offset) limit:@(10) order:BDOrderDefault]];
    parame[@"size"] = @(12);
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduArtistGetSongListSong" forKeyName:@"songlist"];
            SPRunBlockWithPara(completed, [SPBaiduArtistGetSongListRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
