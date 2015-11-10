//
//  SPSearchAlbumCell.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/9.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPBaiduSearchCatalogSugAlbum;

@interface SPSearchAlbumCell : UITableViewCell

@property (nonatomic, weak) SPBaiduSearchCatalogSugAlbum *album;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
