//
//  MUClassSet.h
//  TRDeals
//
//  Created by Magic_Unique on 15/9/28.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUClassSet : NSObject

@property (nonatomic, strong) NSString *keyName;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, assign, readonly) Class classClass;

- (instancetype)initWithKeyName:(NSString *)keyName className:(NSString *)className;
+ (instancetype)setWithKeyName:(NSString *)keyName className:(NSString *)className;

@end
