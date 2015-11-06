//
//  NSMutableDictionary+SPBaiduParame.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "NSMutableDictionary+SPBaiduParame.h"

@implementation NSMutableDictionary (SPBaiduParame)
+ (instancetype)dictionaryWithMethod:(NSString *)method {
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"from"]     = BDFromiOS;
    parame[@"format"]   = BDFormatJSON;
    parame[@"version"]  = BDVersionForiOS;
    parame[@"channel"]  = BDChannel;
    parame[@"method"]   = method;
    return parame;
}

+ (instancetype)dictionaryWithSex:(BDArtistSex)sex area:(BDArtistArea)area abc:(NSString *)abc {
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"sex"] = @(sex);
    parame[@"area"] = @(area);
    parame[@"abc"] = abc ? abc : @"热门";
    return parame;
}

+ (instancetype)dictionaryWithOffset:(NSNumber *)offset limit:(NSNumber *)limit order:(BDOrder)order {
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"offset"] = offset ? offset : @(0);
    parame[@"limit"] = limit ? limit : @(20);
    parame[@"order"] = order ? @(order) : @(BDOrderHot);
    return parame;
}

+ (instancetype)dictionaryWithPageNo:(NSNumber *)page_no pageSize:(NSNumber *)page_size {
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"page_no"] = page_no;
    parame[@"page_size"] = page_size;
    return parame;
}

#define BDSetKey(target, source, key, default) target[key] = source[key] ? source[key] : default

- (void)setBDArtistType:(NSDictionary *)typeDict {
    BDSetKey(self, typeDict, @"sex", @(0));
    BDSetKey(self, typeDict, @"area", @(0));
    BDSetKey(self, typeDict, @"abc", @"热门");
}

- (void)setBDRange:(NSDictionary *)rangeDict {
    BDSetKey(self, rangeDict, @"offset", 0);
    BDSetKey(self, rangeDict, @"limit", @(20));
    BDSetKey(self, rangeDict, @"order", @(1));
}

- (void)setBDPage:(NSDictionary *)pageDict {
    BDSetKey(self, pageDict, @"page_no", @(1));
    BDSetKey(self, pageDict, @"page_size", @(20));
}

#undef BDSetKey
@end
