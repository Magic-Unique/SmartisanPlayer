//
//  NSMutableDictionary+SPBaiduParame.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduTingAPI.h"

@interface NSMutableDictionary (SPBaiduParame)

+ (instancetype)dictionaryWithMethod:(NSString *)method;
- (void)setBDArtistType:(NSDictionary *)typeDict;
- (void)setBDRange:(NSDictionary *)rangeDict;
- (void)setBDPage:(NSDictionary *)pageDict;

+ (instancetype)dictionaryWithOffset:(NSNumber *)offset limit:(NSNumber *)limit order:(BDOrder)order;
+ (instancetype)dictionaryWithSex:(BDArtistSex)sex area:(BDArtistArea)area abc:(NSString *)abc;
+ (instancetype)dictionaryWithPageNo:(NSNumber *)page_no pageSize:(NSNumber *)page_size;

@end
