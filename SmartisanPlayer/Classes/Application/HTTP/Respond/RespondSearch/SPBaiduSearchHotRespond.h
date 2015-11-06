//
//  SPBaiduSearchHotRespond.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@interface SPBaiduSearchHotRespond : SPBaiduRespond

@property (nonatomic, strong) NSArray *result;

@end

@interface SPBaiduSearchHotItem : NSObject

@property (nonatomic, assign) BOOL strong;

@property (nonatomic, copy) NSString *word;

@end
