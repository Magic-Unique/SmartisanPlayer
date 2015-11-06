//
//  MUClassGuide.h
//  kvc
//
//  Created by Magic_Unique on 15/9/24.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  转换指南类
 *
 *  Key-Class对:
 *      如果遇到子字典, 则会从guide中读取子模型的在父模型中的key对应的Class, 将子模型中的字典全部转为Class对象, 再赋值到父模型的key对应的属性中
 *      如果遇到数组, 则会从guide中读取数组在父模型中的key对应的Class, 将数组中的成员全部转为该Class的对象, 并形成数组, 传到父模型的key对应的属性中
 *
 *  NameData-NameObject对:
 *      如果需要更改字典与模型中的key的映射, 比如字典中有@"id", 模型无法声明一个名字为id的属性, 则可加入此库中
 *      如果遇到NameData(比如这里为@"id")对应NameObject(比如这里为@"identity"), 则会将字典中@"id"对应的value, 保存到模型中的identity
 */
@interface MUClassGuide : NSObject

//@property (nonatomic) Class rootClass;

+ (instancetype)guide;

- (void)setClassName:(NSString *)className forKeyName:(NSString *)keyName;
- (Class)classForKeyName:(NSString *)keyName;

- (void)setPropertyMatchNameInData:(NSString *)nameInData toNameInObject:(NSString *)nameInObject;
- (NSString *)nameInObjectForNameInData:(NSString *)nameInData;
- (NSString *)nameInDataForNameInObject:(NSString *)nameInObject;

@end
