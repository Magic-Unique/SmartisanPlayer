//
//  SPBlankView.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/9/18.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPBlankView : UIView

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

+ (instancetype)viewForPlayLists;
+ (instancetype)viewForAlbums;
+ (instancetype)viewForArtists;
+ (instancetype)viewForSongs;

@end
