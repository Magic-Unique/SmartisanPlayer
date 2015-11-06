//
//  NSObject+Model.m
//  kvc
//
//  Created by Magic_Unique on 15/9/24.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "NSObject+Model.h"
#import "MUClassGuide.h"
#import "MUVar.h"
#import <objc/runtime.h>

@implementation NSObject (Model)

#pragma mark - Foundation to Model

+ (instancetype)objectWithFoundation:(id)obj {
    return [self objectWithFoundation:obj andClassGuide:nil];
}

+ (instancetype)objectWithFoundation:(id)obj andClassGuide:(MUClassGuide *)guide {
    if ([obj isDictionary]) return [self objectWithDictionary:obj andClassGuide:guide];
    if ([obj isArray])      return [self arrayWithArray:obj andClassGuide:guide];
    if ([obj isString])     return obj;
    return obj;
    
}

+ (id)objectWithDictionary:(NSDictionary *)dictionary andClassGuide:(MUClassGuide *)guide {
    
    
    NSDictionary *property = [self propertyArray];
    NSObject *model = [[self alloc] init];
    
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        //以下代码用于遍历字典中的所有键值对
        
        //获取被替代的Key的值, 如果nameInObject不存在, 则直接是key
        NSString *newKey = [guide nameInObjectForNameInData:key];
        MUVar *var = property[key];
        
        //是基本数据类型, 直接设置
        if (var.isBase || [var isString]) {
            [model setValue:obj forKey:key];
        } else {
            //获取用户设定的key对应的Class
            Class c = [guide classForKeyName:key];
            
            //如果用户没有设定对应的Class
            if (!c && ![var isArray]) {
                c = var.varClass;
            }
            
            NSObject *newObj = [c objectWithFoundation:obj andClassGuide:guide];
            if (newObj) [model setValue:newObj forKey:newKey];
        }
    }];
    
    return model;
}

+ (id)arrayWithArray:(NSArray *)array andClassGuide:(MUClassGuide *)guide {
    NSMutableArray *newArray = [NSMutableArray array];
    
    for (id sub in array) {
        NSObject *arrayObj = [self objectWithFoundation:sub andClassGuide:guide];
        if (arrayObj)[newArray addObject:arrayObj];
    }
    
    return [newArray copy];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    //防止抛出异常 请勿删除此方法.
    NSLog(@"无法设置%@为%@", key, value);
    NSLog(@"如果不想看到该信息, 请到NSObject-Model.m文件中setValue:forUndefinedKey:的方法中删除输出信息");
}

#pragma mark - Model to Foundation

- (id)foundation {
    return [self foundationWithClassGuide:nil];
}

- (id)foundationWithClassGuide:(MUClassGuide *)guide {
    
    if ([self isDefineClass])   return [self dictionaryWithClassGuide:guide];
    
    if ([self isArray])         return [self arrayWithClassGuide:guide];
    
    if ([self isString])        return self;
    return self;
}

- (NSDictionary *)dictionaryWithClassGuide:(MUClassGuide *)guide {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSDictionary *propertyDict = [[self class] propertyArray];
    
    [propertyDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        MUVar *var = obj;
        NSString *newKey = [guide nameInDataForNameInObject:var.varName];
        NSObject *newObj = [self valueForKey:var.varName];
        
        if (![var isBase]) {
            newObj = [newObj foundationWithClassGuide:guide];
        }
        if (newObj) dict[newKey] = newObj;
    }];
    
    
    return [dict copy];
}

- (NSArray *)arrayWithClassGuide:(MUClassGuide *)guide {
    NSMutableArray *newArray = [NSMutableArray array];
    
    for (NSObject *obj in (NSArray *)self) {
        NSObject *newObj = [obj foundationWithClassGuide:guide];
        if (newObj) [newArray addObject:newObj];
    }
    
    return [newArray copy];
}

#pragma mark - class type

- (BOOL)isTypeOfName:(NSString *)name {
    return [NSStringFromClass(self.class) rangeOfString:name].length > 0;
}

- (BOOL)isDictionary {
    return [self isTypeOfName:@"Dictionary"];
}

- (BOOL)isArray {
    return [self isTypeOfName:@"Array"];
}

- (BOOL)isString {
    return [self isTypeOfName:@"String"];
}

- (BOOL)isFoundation {
    return [self isDictionary] || [self isArray] || [self isString] || [self isTypeOfName:@"NS"];
}

- (BOOL)isDefineClass {
    return ![self isFoundation];
}

+ (NSDictionary *)propertyArray {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    unsigned outCount;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    for (int i = 0; i < outCount; i++) {
        const char *char_t = property_getAttributes(properties[i]);
        MUVar *var = [MUVar varWithPropertyAttributes:char_t];
        if (var.varName || YES) {
            
            dictionary[var.varName] = var;
        }
    }
    return [dictionary copy];
}

@end
