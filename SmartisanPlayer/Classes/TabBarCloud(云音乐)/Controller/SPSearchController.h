//
//  SPSearchController.h
//  SmartisanPlayer
//
//  Created by 吴双 on 15/9/20.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTableViewController.h"






@interface SPSearchController : SPTableViewController

@property (nonatomic, copy, readonly) NSString *query;

/**
 *  用关键字初始化
 *
 *  @param query 关键字
 *
 *  @return instancetype
 */
- (instancetype)initWithQuery:(NSString *)query;

@end
