//
//  SPRequest.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/4.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPBaiduRequest.h"
#import <AFNetworking.h>


@implementation SPBaiduRequest

static NSUInteger count;

+ (AFHTTPRequestOperationManager *)sharedNetworkingManager {
    static AFHTTPRequestOperationManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [AFHTTPRequestOperationManager manager];
        NSMutableSet *set = [NSMutableSet setWithSet:_sharedManager.responseSerializer.acceptableContentTypes];
        [set addObject:@"application/javascript"];
        _sharedManager.responseSerializer.acceptableContentTypes = [set copy];
    });
    return _sharedManager;
}

+ (void)beginIntenetAction {
    if (count == 0) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
    count ++;
}

+ (void)endIntenetAction {
    count --;
    if (count == 0) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}

+ (void)GET:(NSString *)url parameters:(NSDictionary *)param succeed:(SucceedBlock)succeed {
    AFHTTPRequestOperationManager *manager = [self sharedNetworkingManager];
    [self beginIntenetAction];
    NSLog(@"%@", param);
    [manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self endIntenetAction];
        SPRunBlockWithPara(succeed, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self endIntenetAction];
        SPRunBlockWithPara(succeed, nil);
    }];
}

@end


