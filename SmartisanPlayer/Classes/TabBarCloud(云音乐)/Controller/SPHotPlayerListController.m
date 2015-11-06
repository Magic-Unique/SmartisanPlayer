//
//  SPHotPlayerListController.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/7.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPHotPlayerListController.h"
#import "SPSourceView.h"
#import "SPBaiduRequest.h"
//#import "SPArtistListRespond.h"

//#import "MBProgressHUD+MJ.h"
//#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

@interface SPHotPlayerListController ()

@property (nonatomic, assign) NSUInteger count;

@property (nonatomic, strong) NSMutableArray *artistList;

@end

@implementation SPHotPlayerListController

- (instancetype)initWithArtistTypeDictionary:(NSDictionary *)dictionary {
    self = [super initWithStyle:UITableViewStylePlain topView:nil blankView:nil];
    if (self) {
        self.artistType = dictionary;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 90, 0, 0);
        self.tableView.footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(coloadData)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SPSourceView *header = [[SPSourceView alloc] initWithTitle:@"根据百度音乐热门程度排序"];
    self.tableView.tableHeaderView = header;
}

- (void)setArtistType:(NSDictionary *)artistType {
    _artistType = artistType;
    [self reloadData];
}

- (void)reloadData {
//    [MBProgressHUD showMessage:@"loading..."];
//    [SPBaiduRequest requestArtistListWithArtistType:self.artistType offset:0 succeed:^(SPBaiduArtistListRespond *respond) {
//        self.count = [respond.nums unsignedIntValue];
//        [self.artistList removeAllObjects];
//        [self.artistList addObjectsFromArray:respond.artist];
//        [self.tableView reloadData];
//        [MBProgressHUD hideHUD];
//    }];
}

- (void)coloadData {
//    [SPBaiduRequest requestArtistListWithArtistType:self.artistType offset:self.artistList.count succeed:^(SPBaiduArtistListRespond *respond) {
//        self.count = [respond.nums unsignedIntValue];
//        [self.artistList addObjectsFromArray:respond.artist];
//        [self.tableView reloadData];
//        [self.tableView.footer endRefreshing];
//    }];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistList.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier = @"identifier";
//    SPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[SPTableViewCell alloc] initWithReuseIdentifier:identifier];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
//    SPBaiduArtistListArtist *artist = self.artistList[indexPath.row];
//    cell.textLabel.text = artist.name;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ 歌曲:%@首 专辑:%@个", artist.country, artist.songs_total, artist.albums_total];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:artist.avatar_middle] placeholderImage:[UIImage imageNamed:@"noalbumcover_artist"]];
//    return cell;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 懒加载

- (NSMutableArray *)artistList {
    if (!_artistList) {
        _artistList = [NSMutableArray array];
    }
    return _artistList;
}

@end
