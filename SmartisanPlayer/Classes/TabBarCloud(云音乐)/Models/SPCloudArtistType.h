//
//  SPCloudArtistType.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/26.
//  Copyright © 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPCloudArtistType : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 性别 */
@property (nonatomic, strong) NSNumber *sex;

/** 地区 */
@property (nonatomic, strong) NSNumber *area;

@end
