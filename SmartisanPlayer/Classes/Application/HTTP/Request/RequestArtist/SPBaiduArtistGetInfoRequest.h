//
//  SPBaiduArtistGetInfoRequest.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRequest.h"

#import "SPBaiduArtistGetInfoRespond.h"

typedef void(^InfoBlock)(SPBaiduArtistGetInfoRespond *respond);

@interface SPBaiduArtistGetInfoRequest : SPBaiduRequest

+ (void)artistInfoWithTingUID:(NSString *)tingUID completed:(InfoBlock)completed;

@end
