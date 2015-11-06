//
//  SPRequest.h
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/4.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "BaiduTingAPI.h"
#import "NSMutableDictionary+SPBaiduParame.h"
#import "MUModel.h"


typedef void(^SucceedBlock)(id responseObject);



@interface SPBaiduRequest : NSObject

+ (void)GET:(NSString *)url parameters:(NSDictionary *)param succeed:(SucceedBlock)succeed;

@end



