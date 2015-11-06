//
//  SPArtistsController.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/18.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPArtistsController.h"

#import "SPBlankView.h"

@interface SPArtistsController ()

@end

@implementation SPArtistsController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain topView:[SPTopView new] blankView:[SPBlankView viewForArtists]];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupTableView];
    
}


#pragma mark - view

- (void)setupTableView {
//    self.tableView.backgroundView = [SPBlankView viewForArtists];
//    [[SPBlankView alloc] initWithImage:[UIImage imageNamed:@"blank_artist"] title:@"赞无艺术家" message:@"本地歌曲的表演艺术家将显示在这里"];
    
    
//    UIView *emptyView = [[UIView alloc] init];
//    self.tableView.tableFooterView = emptyView;
//    self.tableView.tableHeaderView = emptyView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
@end
