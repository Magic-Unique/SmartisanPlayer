//
//  MUVar.h
//  TRDeals
//
//  Created by Magic_Unique on 15/9/28.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUVar : NSObject

@property (nonatomic, strong) NSString *varType;
@property (nonatomic, strong) NSString *varName;

@property (nonatomic, assign, readonly, getter=isFoundation)    BOOL foundation;
@property (nonatomic, assign, readonly, getter=isArray)         BOOL array;
@property (nonatomic, assign, readonly, getter=isDictionary)    BOOL dictionary;
@property (nonatomic, assign, readonly, getter=isString)        BOOL string;
@property (nonatomic, assign, readonly, getter=isDefineClass)   BOOL defineClass;
@property (nonatomic, assign, readonly, getter=isBase)          BOOL base;

@property (nonatomic, assign, readonly)                         Class varClass;

- (instancetype)initWithPropertyAttributes:(const char *)attributes;
+ (instancetype)varWithPropertyAttributes:(const char *)attributes;

@end
