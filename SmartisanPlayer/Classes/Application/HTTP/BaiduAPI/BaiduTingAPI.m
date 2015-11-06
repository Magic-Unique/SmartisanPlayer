//
//  BaiduTingAPI.m
//  BaiduAPI
//
//  Created by Magic_Unique on 15/11/6.
//  Copyright © 2015年 Magic_Unique. All rights reserved.
//

#import "BaiduTingAPI.h"

/** ----------------------------------------------------------------------------------------------- */
NSString *const BDURLTing                   =   @"http://tingapi.ting.baidu.com/v1/restserver/ting"   ;
NSString *const BDURLDownload               =   @"http://ting.baidu.com/data/music/links"             ;
/** =============================================================================================== */
NSString *const BDMethodSearchHot           =   @"baidu.ting.search.hot"                ;
NSString *const BDMethodSearchCatalogSug    =   @"baidu.ting.search.catalogSug"         ;
NSString *const BDMethodSearchMerge         =   @"baidu.ting.search.merge"              ;

NSString *const BDMethodArtistList          =   @"baidu.ting.artist.getList"            ;
NSString *const BDMethodArtistGetInfo       =   @"baidu.ting.artist.getinfo"            ;
NSString *const BDMethodArtistGetSongList   =   @"baidu.ting.artist.getSongList"        ;
NSString *const BDMethodArtistGetAlbumList  =   @"baidu.ting.artist.getAlbumList"       ;

NSString *const BDMethodAlbumGetAlbumInfo   =   @"baidu.ting.album.getAlbumInfo"        ;

NSString *const BDMethodSongDownWeb         =   @"baidu.ting.song.downWeb"              ;
/** ----------------------------------------------------------------------------------------------- */
NSString *const BDMethodBillboardBillList   =   @"baidu.ting.billboard.billList"        ;
NSString *const BDMethodAdvShowList         =   @"baidu.ting.adv.showlist"              ;
NSString *const BDMethodSongLrc             =   @"baidu.ting.song.lry"                  ;
NSString *const BDMethodSongRecommandList   =   @"baidu.ting.song.getRecommandSongList" ;
/** =============================================================================================== */
NSString *const BDFromWebApp                =   @"webapp_music" ;
NSString *const BDFromQianQian              =   @"qianqian"     ;
NSString *const BDFromiOS                   =   @"ios"          ;
NSString *const BDFromiPad                  =   @"ipad"         ;
/** ---------------------------------------------------------- */
NSString *const BDVersionForiOS             =   @"5.3.2"        ;
NSString *const BDVersionForiPad            =   @"2.3.1"        ;
/** ---------------------------------------------------------- */
NSString *const BDFormatJSON                =   @"json"         ;
NSString *const BDFormatXML                 =   @"xml"          ;
/** ---------------------------------------------------------- */
NSString *const BDChannel                   =   @"appstore"     ;
