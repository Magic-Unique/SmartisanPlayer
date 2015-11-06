//
//  SPBaiduArtistGetInfoRequest.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduArtistGetInfoRequest.h"

@implementation SPBaiduArtistGetInfoRequest

+ (void)artistInfoWithTingUID:(NSString *)tingUID completed:(InfoBlock)completed {
    NSMutableDictionary *parame = [NSMutableDictionary dictionaryWithMethod:BDMethodArtistGetInfo];
    parame[@"tinguid"] = tingUID;
    parame[@"artistid"] = @"(null)";
    [self GET:BDURLTing parameters:parame succeed:^(id responseObject) {
        if (responseObject) {
            SPRunBlockWithPara(completed, [SPBaiduArtistGetInfoRespond objectWithFoundation:responseObject]);
        } else {
            SPRunBlockWithPara(completed, nil);
        }
        NSLog(@"%@", responseObject);
    }];
}

@end
