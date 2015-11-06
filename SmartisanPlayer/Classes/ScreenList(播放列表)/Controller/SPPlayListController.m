//
//  SPPlayListController.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/9/20.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPPlayListController.h"
#import "SPAddItemView.h"

@interface SPPlayListController ()

@end

@implementation SPPlayListController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain topView:[SPAddItemView new] blankView:[SPBlankView viewForPlayLists]];
    if (self) {
    }
    return self;
}


@end
