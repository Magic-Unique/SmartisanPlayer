//
//  SPBaiduArtistGetAlbumListRequest.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduArtistGetAlbumListRequest.h"

@implementation SPBaiduArtistGetAlbumListRequest

+ (void)artistAlbumListWithTingUID:(NSString *)tingUID
                         andOffset:(NSUInteger)offset
                         completed:(AlbumListBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodArtistGetAlbumList];
    [parame setBDRange:[NSMutableDictionary dictionaryWithOffset:@(offset) limit:@(2) order:BDOrderHot]];
    parame[@"tinguid"] = tingUID;
    parame[@"artistid"] = @"(null)";
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            MUClassGuide *guide = [MUClassGuide guide];
            [guide setClassName:@"SPBaiduArtistGetAlbumListAlbum" forKeyName:@"albumlist"];
            SPRunBlockWithPara(completed, [SPBaiduArtistGetAlbumListRespond objectWithFoundation:responseObject andClassGuide:guide]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
