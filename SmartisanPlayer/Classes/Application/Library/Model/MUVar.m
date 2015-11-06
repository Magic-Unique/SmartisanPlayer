//
//  MUVar.m
//  TRDeals
//
//  Created by Magic_Unique on 15/9/28.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "MUVar.h"

@implementation MUVar

- (instancetype)initWithPropertyAttributes:(const char *)attributes {
    self = [super init];
    if (self) {
        NSString *att = [NSString stringWithUTF8String:attributes];
        NSArray *array = [att componentsSeparatedByString:@","];
        self.varType = [MUVar typeName:array.firstObject];
        self.varName = [MUVar varName:array.lastObject];
    }
    return self;
}

+ (instancetype)varWithPropertyAttributes:(const char *)attributes {
    return [[self alloc] initWithPropertyAttributes:attributes];
}

- (Class)varClass {
    Class c = NSClassFromString(self.varType);
    return c ? c : [NSObject class];
}

- (BOOL)isBase {
    return [self.varType isEqualToString:@"Q"];
}

- (BOOL)isArray {
    return [self.varType rangeOfString:@"Array"].length > 0;
}

- (BOOL)isDictionary {
    return [self.varType rangeOfString:@"Dictionary"].length > 0;
}

- (BOOL)isString {
    return [self.varType rangeOfString:@"String"].length > 0;
}

- (BOOL)isFoundation {
    return [self.varType hasPrefix:@"NS"];
}

- (BOOL)isDefineClass {
    if (self.isFoundation || self.isBase) {
        return NO;
    } else return YES;
}

+ (NSString *)typeName:(NSString *)string {
    NSUInteger length = [string length];
    NSString *typeCode = [string substringWithRange:NSMakeRange(1, 1)];
    if ([typeCode isEqualToString:@"@"]) {
        return [string substringWithRange:NSMakeRange(3, length - 4)];
    }
    return @"Q";
}

+ (NSString *)varName:(NSString *)string {
    NSUInteger length = [string length];
    return [string substringWithRange:NSMakeRange(2, length - 2)];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, %@", self.varName, self.varType, [self isFoundation]?@"YES":@"NO"];
}

@end
