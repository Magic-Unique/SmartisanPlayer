//
//  MUClassGuide.m
//  kvc
//
//  Created by Magic_Unique on 15/9/24.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "MUClassGuide.h"

#import "MUPropertySet.h"
#import "MUClassSet.h"

@interface MUClassGuide ()

@property (nonatomic, strong) NSMutableArray *classSets;

@property (nonatomic, strong) NSMutableArray *propertySets;

@end

@implementation MUClassGuide

+ (instancetype)guide {
    return [[self alloc] init];
}

#pragma mark - class - key

- (MUClassSet *)classSetForKeyName:(NSString *)keyName {
    for (MUClassSet *set in self.classSets) {
        if ([set.keyName isEqualToString:keyName]) {
            return set;
        }
    }
    return nil;
}

- (void)setClassName:(NSString *)className forKeyName:(NSString *)keyName {
    Class c = NSClassFromString(className);
    if (c) {
        MUClassSet *set = [self classSetForKeyName:keyName];
        if (set) {
            set.className = className;
        } else {
            set = [MUClassSet setWithKeyName:keyName className:className];
            [self.classSets addObject:set];
        }
    }
}

- (Class)classForKeyName:(NSString *)keyName {
    MUClassSet *set = [self classSetForKeyName:keyName];
    return set.classClass;
}


#pragma mark - property - key

- (MUPropertySet *)propertySetForDataName:(NSString *)dataName {
    for (MUPropertySet *set in self.propertySets) {
        if ([set.nameInData isEqualToString:dataName]) {
            return set;
        }
    }
    return nil;
}

- (MUPropertySet *)propertySetForObjectName:(NSString *)objectName {
    for (MUPropertySet *set in self.propertySets) {
        if ([set.nameInObject isEqualToString:objectName]) {
            return set;
        }
    }
    return nil;
}

- (void)setPropertyMatchNameInData:(NSString *)nameInData toNameInObject:(NSString *)nameInObject {
    MUPropertySet *set = [self propertySetForDataName:nameInData];
    if (set) {
        set.nameInObject = nameInObject;
    } else {
        set = [MUPropertySet setWithDataName:nameInData objectName:nameInObject];
        [self.propertySets addObject:set];
    }
}

- (NSString *)nameInObjectForNameInData:(NSString *)nameInData {
    MUPropertySet *set = [self propertySetForDataName:nameInData];
    return set ? set.nameInObject : nameInData;
}

- (NSString *)nameInDataForNameInObject:(NSString *)nameInObject {
    MUPropertySet *set = [self propertySetForObjectName:nameInObject];
    return set ? set.nameInData : nameInObject;
}

#pragma mark - lazy load 

- (NSMutableArray *)classSets
{
    if (!_classSets) {
        _classSets = [NSMutableArray array];
    }
    return _classSets;
}

- (NSMutableArray *)propertySets
{
    if (!_propertySets) {
        _propertySets = [NSMutableArray array];
    }
    return _propertySets;
}
@end
