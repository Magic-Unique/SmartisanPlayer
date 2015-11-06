//
//  SPArtistGetInfoRespond.h
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@interface SPBaiduArtistGetInfoRespond : SPBaiduRespond

/***************** Image ************************/

/** image for 20 */
@property (nonatomic, copy) NSString *avatar_mini;
/** image for 48 */
@property (nonatomic, copy) NSString *avatar_small;
/** image for 120 */
@property (nonatomic, copy) NSString *avatar_middle;
/** image for 180 */
@property (nonatomic, copy) NSString *avatar_s180;
/** image for 240 */
@property (nonatomic, copy) NSString *avatar_big;
/** image for 500 */
@property (nonatomic, copy) NSString *avatar_s500;
/** image for 1000 */
@property (nonatomic, copy) NSString *avatar_s1000;

/**************** Personal ***********************/

/** 姓名 */
@property (nonatomic, copy) NSString *name;
/** 首字母 */
@property (nonatomic, copy) NSString *firstchar;
/** 性别:男=@"0", 女=@"1" */
@property (nonatomic, copy) NSString *gender;
/** 生日:YYYY-MM-DD */
@property (nonatomic, copy) NSString *birth;
/** 星座 */
@property (nonatomic, copy) NSString *constellation;
/** 血型 */
@property (nonatomic, copy) NSString *bloodtype;
/** 体重 */
@property (nonatomic, copy) NSString *weight;
/** 简介 */
@property (nonatomic, copy) NSString *intro;
/** 身高 */
@property (nonatomic, copy) NSString *stature;
/** 公司 */
@property (nonatomic, copy) NSString *company;
/** 地区 */
@property (nonatomic, copy) NSString *area;
/** 国家 */
@property (nonatomic, copy) NSString *country;

/*************** Baidu Ting **********************/

/** 艺术家ID */
@property (nonatomic, copy) NSString *artist_id;
/** tingUID */
@property (nonatomic, copy) NSString *ting_uid;
/** piao_ID */
@property (nonatomic, copy) NSString *piao_id;
/** 来源 */
@property (nonatomic, copy) NSString *source;
/** 百度音乐地址 */
@property (nonatomic, copy) NSString *url;
/** 未知属性 */
@property (nonatomic, copy) NSString *aliasname;
/** 未知属性 */
@property (nonatomic, copy) NSString *translatename;

/** 专辑个数 */
@property (nonatomic, copy) NSString *albums_total;
/** 歌曲个数 */
@property (nonatomic, copy) NSString *songs_total;

@end
