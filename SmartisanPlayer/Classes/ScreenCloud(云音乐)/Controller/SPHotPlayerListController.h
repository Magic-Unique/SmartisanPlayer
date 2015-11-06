//
//  SPHotPlayerListController.h
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/7.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPTableViewController.h"

@interface SPHotPlayerListController : SPTableViewController

@property (nonatomic, strong) NSDictionary *artistType;

- (instancetype)initWithArtistTypeDictionary:(NSDictionary *)dictionary;

@end
