//
//  SPArtistListRespond.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/26.
//  Copyright © 2015年 Unique. All rights reserved.
//

#import "SPBaiduRespond.h"

@interface SPBaiduArtistGetListRespond : SPBaiduRespond

@property (nonatomic, strong) NSNumber *nums;

@property (nonatomic, strong) NSString *noFirstChar;

@property (nonatomic, strong) NSArray *artist;

@end





@interface SPBaiduArtistGetListArtist : NSObject
/** 性别:男=@"0", 女=@"1" */
@property (nonatomic, copy) NSString *gender;
/** Image for 20 */
@property (nonatomic, copy) NSString *avatar_mini;
/** Image for 48 */
@property (nonatomic, copy) NSString *avatar_small;
/** Image for 120 */
@property (nonatomic, copy) NSString *avatar_middle;
/** Image for 240 */
@property (nonatomic, copy) NSString *avatar_big;

@property (nonatomic, copy) NSString *piao_id;

@property (nonatomic, copy) NSString *albums_total;

@property (nonatomic, copy) NSString *artist_id;

@property (nonatomic, copy) NSString *songs_total;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *firstchar;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *ting_uid;

@property (nonatomic, copy) NSString *name;

@end
