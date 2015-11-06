//
//  SPSongController.m
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/18.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPSongController.h"
//#import "SPPlayViewController.h"


@interface SPSongController ()

@property (nonatomic, strong) NSArray *musics;

@end

@implementation SPSongController

- (instancetype)init {
    return [self initWithSongs:nil];
}

- (instancetype)initWithSongs:(NSArray *)songs {
    self = [super initWithStyle:UITableViewStylePlain topView:[SPTopView new] blankView:[SPBlankView viewForSongs]];
    if (self) {
        self.musics = songs;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - view

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.musics.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identifier = @"identifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//        cell.textLabel.textColor = APP_COLOR_MAIN_TITLE;
//        cell.detailTextLabel.textColor = APP_COLOR_CONTENT;
//    }
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//}

@end
