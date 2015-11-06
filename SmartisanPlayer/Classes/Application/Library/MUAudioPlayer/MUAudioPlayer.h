//
//  MUAudioPlayer.h
//  NSDataPlayer
//
//  Created by Magic_Unique on 15/10/14.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class MUAudioPlayer;


typedef NS_ENUM(NSUInteger, MUAudioPlayerStopReason) {
    MUAudioPlayerStopReasonUserStop,
    MUAudioPlayerStopReasonPlayCompleted,
    MUAudioPlayerStopReasonFileBreak,
};






@protocol MUAudioPlayerDelegate <NSObject>

@optional

//online player:download progress;      local player:progress = 1 for onece
- (void)audioPlayer:(MUAudioPlayer *)player downloadForProgress:(CGFloat)progress;
- (void)audioPlayer:(MUAudioPlayer *)player downloadForPlayable:(BOOL)playable;
- (void)audioPlayer:(MUAudioPlayer *)player downloadCompleted:(NSData *)data;
- (void)audioPlayer:(MUAudioPlayer *)player downloadFailed:(NSError *)error;

//start play at time
- (void)audioPlayer:(MUAudioPlayer *)player didPlayAtTime:(NSTimeInterval)time;
//start pause at time
- (void)audioPlayer:(MUAudioPlayer *)player didPauseAtTime:(NSTimeInterval)time;
//ChangeCurrentTime is enable in CurrentTimeListener;
- (void)audioPlayer:(MUAudioPlayer *)player didChangeCurrentTimeFromTime:(NSTimeInterval)fromTime;
//stop for sumeone reason
- (void)audioPlayer:(MUAudioPlayer *)player didStopForReason:(MUAudioPlayerStopReason)reason;

@end







@interface MUAudioPlayer : NSObject

@property (nonatomic, strong, readonly) NSString        *fileType;
@property (nonatomic, assign, readonly) NSUInteger      fileLength;
@property (nonatomic, assign, readonly) NSTimeInterval  duration;
@property (nonatomic, strong, readonly) NSData          *fileData;//enable after download completed. Before that will get nil.

@property (nonatomic, assign, readonly) CGFloat         playableProgress;
@property (nonatomic, assign, readonly) NSTimeInterval  current;


@property (nonatomic, assign, readonly) BOOL canPlay;
@property (nonatomic, assign, readonly, getter=isPlaying) BOOL playing;

@property (nonatomic, assign) id<MUAudioPlayerDelegate> delegate;

- (instancetype)initWithContentURL:(NSURL *)URL;
- (instancetype)initWithContentURL:(NSURL *)URL delegate:(id<MUAudioPlayerDelegate>)delegate;

- (BOOL)play;
- (void)pause;
- (void)stop;

- (BOOL)seekToTime:(NSTimeInterval)time;

/**
 *  CurrentTimeListener is a NSTimer for listen player's currentTime. If you start listen, you must stop it before dealloc.
 */

- (void)startCurrentTimeListener;
- (void)stopCurrentTimeListener;

@end
