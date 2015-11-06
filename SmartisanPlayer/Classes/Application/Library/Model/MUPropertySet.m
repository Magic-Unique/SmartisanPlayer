//
//  MUPropertySet.m
//  TRDeals
//
//  Created by Magic_Unique on 15/9/28.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "MUPropertySet.h"

@implementation MUPropertySet

- (instancetype)initWithDataName:(NSString *)dataName objectName:(NSString *)objectName {
    self = [super init];
    if (self) {
        self.nameInData = dataName;
        self.nameInObject = objectName;
    }
    return self;
}

+ (instancetype)setWithDataName:(NSString *)dataName objectName:(NSString *)objectName {
    return [[self alloc] initWithDataName:dataName objectName:objectName];
}

@end
