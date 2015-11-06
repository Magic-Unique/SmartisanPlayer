//
//  Foundation+Log.m
//  Tools
//
//  Created by Magic_Unique on 15/8/22.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSString (Log)

+ (instancetype)stringWithTab:(NSUInteger)length {
    NSMutableString *str = [NSMutableString stringWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [str appendString:@"\t"];
    }
    return [str copy];
}

@end

static unsigned char tab = 1;

@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"{\n"];
    
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            [str appendFormat:@"%@%@ = \"%@\",\n", [NSString stringWithTab:tab], key, obj];
        } else {
            tab++;
            [str appendFormat:@"%@%@ = %@,\n", [NSString stringWithTab:tab-1], key, obj];
            tab--;
        }
    }];
    
    [str appendFormat:@"%@}", [NSString stringWithTab:tab-1]];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
}
@end

@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"[\n"];
    
    // 遍历数组的所有元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            [str appendFormat:@"\"%@\"", obj];
        } else {
            tab++;
            [str appendFormat:@"%@%@,\n", [NSString stringWithTab:tab-1], obj];
            tab--;
        }
    }];
    
    [str appendFormat:@"%@]", [NSString stringWithTab:tab-1]];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
}
@end
