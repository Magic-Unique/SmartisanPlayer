//
//  MUPropertySet.h
//  TRDeals
//
//  Created by Magic_Unique on 15/9/28.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUPropertySet : NSObject

@property (nonatomic, strong) NSString *nameInData;
@property (nonatomic, strong) NSString *nameInObject;

- (instancetype)initWithDataName:(NSString *)dataName objectName:(NSString *)objectName;
+ (instancetype)setWithDataName:(NSString *)dataName objectName:(NSString *)objectName;

@end
