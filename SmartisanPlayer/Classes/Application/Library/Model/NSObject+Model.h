//
//  NSObject+Model.h
//  kvc
//
//  Created by Magic_Unique on 15/9/24.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MUClassGuide;

@interface NSObject (Model)

/**
 *  数据转模型, 等价于guide = nil
 *
 *  @param obj Foundation数据
 *
 *  @return 本类对象
 */
+ (instancetype)objectWithFoundation:(id)obj;

/**
 *  数据转模型
 *
 *  @param obj   Foundation数据
 *  @param guide 转换指南
 *
 *  @return 本类对象
 */
+ (instancetype)objectWithFoundation:(id)obj andClassGuide:(MUClassGuide *)guide;


/**
 *  模型转数据, 等价于guide = nil
 *
 *  @return Foundation数据
 */
- (id)foundation;

/**
 *  模型转数据
 *
 *  @param guide 转换指南
 *
 *  @return Foundation数据
 */
- (id)foundationWithClassGuide:(MUClassGuide *)guide;


@end
