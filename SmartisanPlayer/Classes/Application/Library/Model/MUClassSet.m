//
//  MUClassSet.m
//  TRDeals
//
//  Created by Magic_Unique on 15/9/28.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "MUClassSet.h"

@implementation MUClassSet

- (instancetype)initWithKeyName:(NSString *)keyName className:(NSString *)className {
    self = [super init];
    if (self) {
        self.keyName = keyName;
        self.className = className;
    }
    return self;
}

+ (instancetype)setWithKeyName:(NSString *)keyName className:(NSString *)className {
    return [[self alloc] initWithKeyName:keyName className:className];
}

- (Class)classClass {
    Class c = NSClassFromString(self.className);
    return c ? c : [NSObject class];
}

@end
