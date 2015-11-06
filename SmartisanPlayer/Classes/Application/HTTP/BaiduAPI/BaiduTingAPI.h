//
//  BaiduTingAPI.h
//  SmartisanPlayer
//
//  Created by Magic_Unique on 15/10/27.
//  Copyright © 2015年 Unique. All rights reserved.
//


#import <Foundation/Foundation.h>
/** ----------------------------------------------------------------------------------------------- */
extern NSString *const BDURLTing                    ;
extern NSString *const BDURLDownload                ;
/** =============================================================================================== */
extern NSString *const BDMethodSearchHot            ;
extern NSString *const BDMethodSearchCatalogSug     ;
extern NSString *const BDMethodSearchMerge          ;

extern NSString *const BDMethodArtistList           ;
extern NSString *const BDMethodArtistGetInfo        ;
extern NSString *const BDMethodArtistGetSongList    ;
extern NSString *const BDMethodArtistGetAlbumList   ;

extern NSString *const BDMethodAlbumGetAlbumInfo    ;

extern NSString *const BDMethodSongDownWeb          ;
/** ----------------------------------------------------------------------------------------------- */
extern NSString *const BDMethodBillboardBillList    ;
extern NSString *const BDMethodAdvShowList          ;
extern NSString *const BDMethodSongLrc              ;
extern NSString *const BDMethodSongRecommandList    ;
/** =============================================================================================== */
extern NSString *const BDFromWebApp                 ;
extern NSString *const BDFromQianQian               ;
extern NSString *const BDFromiOS                    ;
extern NSString *const BDFromiPad                   ;
/** ---------------------------------------------------------- */
extern NSString *const BDVersionForiOS              ;
extern NSString *const BDVersionForiPad             ;
/** ---------------------------------------------------------- */
extern NSString *const BDFormatJSON                 ;
extern NSString *const BDFormatXML                  ;
/** ---------------------------------------------------------- */
extern NSString *const BDChannel                    ;

typedef NS_ENUM(NSUInteger, BDArtistSex) {
    BDArtistSexDefault = 0,
    BDArtistSexMale = 1,
    BDArtistSexFemale = 2,
    BDArtistSexOther = 4,
};

typedef NS_ENUM(NSUInteger, BDArtistArea) {
    BDArtistAreaDefault = 0,
    BDArtistAreaChina = 6,
    BDArtistAreaEuropeAndAmerica = 3,
    BDArtistAreaKorean = 7,
    BDArtistAreaJapan = 60,
    BDArtistAreaOther = 5,
};

typedef NS_ENUM(NSUInteger, BDOrder) {
    BDOrderHot = 1,
    BDOrderDefault = 2,
};

