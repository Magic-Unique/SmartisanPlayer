//
//  SPSearchRespond.m
//  SmartisanPlayer
//
//  Created by 吴双 on 15/10/4.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "SPBaiduSearchCatalogSugRespond.h"
#import "MUModel.h"

@implementation SPBaiduSearchCatalogSugRespond

- (NSArray *)orderArray {
    return [self.order componentsSeparatedByString:@","];
}

- (NSArray *)song {
    if (!_song) {
        _song = [[NSArray alloc] init];
    }
    return _song;
}

- (NSArray *)album {
    if (!_album) {
        _album = [[NSArray alloc] init];
    }
    return _album;
}

- (NSArray *)artist {
    if (!_artist) {
        _artist = [[NSArray alloc] init];
    }
    return _artist;
}

- (void)dealloc {
#ifdef DEBUG_LOG_DEALLOC
    NSLog(@"%s", __FUNCTION__);
#endif
}
@end




@implementation SPBaiduSearchCatalogSugAlbum
- (void)dealloc {
#ifdef DEBUG_LOG_DEALLOC
    NSLog(@"%s", __FUNCTION__);
#endif
}
@end




@implementation SPBaiduSearchCatalogSugArtist
- (void)dealloc {
#ifdef DEBUG_LOG_DEALLOC
    NSLog(@"%s", __FUNCTION__);
#endif
}
@end




@implementation SPBaiduSearchCatalogSugSong
- (void)dealloc {
#ifdef DEBUG_LOG_DEALLOC
    NSLog(@"%s", __FUNCTION__);
#endif
}
@end