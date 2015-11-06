//
//  SPAlbumController.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/18.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPAlbumController.h"

#import "SPBlankView.h"
//#import "UIImageView+WebCache.h"

@interface SPAlbumController ()

@property (nonatomic, strong) NSArray *albumList;

@end

@implementation SPAlbumController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain topView:[SPTopView new] blankView:[SPBlankView viewForAlbums]];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.albumList.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identifier = @"identifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    return cell;
//}

@end
