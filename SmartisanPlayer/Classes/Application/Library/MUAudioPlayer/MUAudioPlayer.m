//
//  MUAudioPlayer.m
//  NSDataPlayer
//
//  Created by Magic_Unique on 15/10/14.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "MUAudioPlayer.h"

#define MODE_FILE   YES
#define MODE_HTTP   NO

@interface MUAudioPlayer () <NSURLSessionDataDelegate, AVAudioPlayerDelegate>
{
    BOOL playableCheck;
    NSTimeInterval breakTime;
    AVAudioPlayer *_player;
}

//URL部分, 创建时候赋值
@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, assign, readonly) BOOL isFILE;
@property (nonatomic, assign, readonly) BOOL isHTTP;

/** 播放器 */
@property (nonatomic, strong) AVAudioPlayer *player;

/** 数据缓存 */
@property (nonatomic, strong) NSMutableData *dataBuff;

//下载与请求部分
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDataTask *task;
@property (nonatomic, assign) long long targetLength;
@property (nonatomic, strong) NSString *targetType;
@property (nonatomic, assign, readonly, getter=hasDownload) BOOL download;

/** 播放数据 */
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval lastTime;

@end


@implementation MUAudioPlayer

- (instancetype)initWithContentURL:(NSURL *)URL {
    return [self initWithContentURL:URL delegate:nil];
}

- (instancetype)initWithContentURL:(NSURL *)URL delegate:(id<MUAudioPlayerDelegate>)delegate {
    self = [super init];
    if (self) {
        _download = NO;
        _url = URL;
        self.delegate = delegate;
        if (self.isHTTP) {
            //如果是在线播放, 则立刻开始下载
            [self.task resume];
        }
        if (self.isFILE) {
            //直接触发下载代理事件
            [self audioPlayerLocalModeDelegate];
        }
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
    [_player    stop];
    [_session   invalidateAndCancel];
    [_task      cancel];
    _url        =   nil;
    _player     =   nil;
    _session    =   nil;
    _task       =   nil;
    _dataBuff   =   nil;
    _timer      =   nil;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[MUAudioPlayer class]]) {
        return NO;
    }
    MUAudioPlayer *target = object;
    if ([target.url.absoluteString isEqualToString:self.url.absoluteString]) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 公开方法

- (BOOL)play {
    if (!self.canPlay) {
        return NO;
    }
    BOOL succeed = NO;
    if (breakTime > 0) {
        succeed = [self.player play];
    } else {
        breakTime = 0;
        succeed = [self.player play];
    }
    if (succeed) {
        if ([self.delegate respondsToSelector:@selector(audioPlayer:didPlayAtTime:)]) {
            [self.delegate audioPlayer:self didPlayAtTime:breakTime];
        }
    }
    breakTime = -1;
    return succeed;
}

- (void)pause {
    if (_player) {
        breakTime = self.player.currentTime;
        [self.player pause];
        if ([self.delegate respondsToSelector:@selector(audioPlayer:didPauseAtTime:)]) {
            [self.delegate audioPlayer:self didPauseAtTime:breakTime];
        }
    }
}

- (void)stop {
    if (_player) {
        breakTime = -1;
        self.player = nil;
        if ([self.delegate respondsToSelector:@selector(audioPlayer:didStopForReason:)]) {
            [self.delegate audioPlayer:self didStopForReason:MUAudioPlayerStopReasonUserStop];
        }
    }
}

- (BOOL)seekToTime:(NSTimeInterval)time {
    self.player.currentTime = time;
    if ([self.player play]) {
        if ([self.delegate respondsToSelector:@selector(audioPlayer:didPlayAtTime:)]) {
            [self.delegate audioPlayer:self didPlayAtTime:time];
        }
    }
    return YES;
}

- (void)startCurrentTimeListener {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timerMission) userInfo:nil repeats:YES];
}

- (void)stopCurrentTimeListener {
    self.timer = nil;
}

#pragma mark - 属性设置

- (void)setPlayer:(AVAudioPlayer *)player {
    [_player stop];
    player.delegate = self;
    _player = player;
}

#pragma mark - 属性读取

- (NSTimeInterval)duration {
    return self.player.duration;
}

- (NSTimeInterval)current {
    return self.player.currentTime;
}

- (NSUInteger)fileLength {
    return (NSUInteger)self.targetLength;
}

- (NSString *)fileType {
    return self.targetType;
}

- (CGFloat)playableProgress {
    return self.dataBuff.length * 1.0 / self.targetLength;
}

- (NSData *)fileData {
    if (self.hasDownload) {
        return [self.dataBuff copy];
    } else {
        return nil;
    }
}

- (AVAudioPlayer *)player {
    if (!_player) {
        _player = [[AVAudioPlayer alloc] initWithData:self.dataBuff error:nil];
        _player.delegate = self;
    }
    return _player;
}

#pragma mark - 私有方法

- (BOOL)isFILE {
    return self.url.isFileURL;
}

- (BOOL)isHTTP {
    return !self.url.isFileURL;
}

- (BOOL)canPlay {
    return self.playableProgress > 0.1;
}

- (BOOL)fileExist {
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:self.url.path];
}

- (BOOL)isPlaying {
    return self.player.isPlaying;
}

- (void)timerMission {
    NSTimeInterval current = self.current;
    if (current != self.lastTime && current) {
        if ([self.delegate respondsToSelector:@selector(audioPlayer:didChangeCurrentTimeFromTime:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate audioPlayer:self didChangeCurrentTimeFromTime:self.lastTime];
            });
        }
        self.lastTime = current;
    }
}

- (void)audioPlayerLocalModeDelegate {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:1];
        if ([self fileExist]) {
            NSData *data = [NSData dataWithContentsOfFile:self.url.path];
            self.targetLength = data.length;
            self.targetType = [self.url.absoluteString componentsSeparatedByString:@"."].lastObject;
            [self URLSession:_session dataTask:_task didReceiveData:data];
        } else {
            NSError *error = [NSError errorWithDomain:@"MUAudioPlayer" code:0 userInfo:@{@"reason":@"Can not found file[local file]"}];
            [self URLSession:_session task:_task didCompleteWithError:error];
        }
    });
}

#pragma mark - 播放代理

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (!self.hasDownload) {
        //play stop for file break.
        breakTime = player.currentTime;
        if ([self.delegate respondsToSelector:@selector(audioPlayer:didStopForReason:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate audioPlayer:self didStopForReason:MUAudioPlayerStopReasonFileBreak];
            });
        }
    } else {
        //play stop for file end.
        if ([self.delegate respondsToSelector:@selector(audioPlayer:didStopForReason:)]) {
            [self.delegate audioPlayer:self didStopForReason:MUAudioPlayerStopReasonPlayCompleted];
        }
    }
    self.player = nil;
}

#pragma mark - 请求代理

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    self.task = nil;
    if (error) {
        if ([self.delegate respondsToSelector:@selector(audioPlayer:downloadFailed:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate audioPlayer:self downloadFailed:error];
            });
        }
    }
}

#pragma mark - 数据代理

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    self.targetLength = response.expectedContentLength;
    self.targetType = [response.suggestedFilename componentsSeparatedByString:@"."].lastObject;
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    [self.dataBuff appendData:data];
    long long hasLength     =   (long long)self.dataBuff.length;
    long long targetLength  =              self.targetLength;
    
    //进度被改变
    if (targetLength >= hasLength) {
        if ([self.delegate respondsToSelector:@selector(audioPlayer:downloadForProgress:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate audioPlayer:self downloadForProgress:self.playableProgress];
            });
        }
        
        if (self.canPlay && !playableCheck) {
            if ([self.delegate respondsToSelector:@selector(audioPlayer:downloadForPlayable:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.delegate audioPlayer:self downloadForPlayable:YES];
                });
            }
            playableCheck = YES;
        }
    }
    
    //下载完成
    if (targetLength == hasLength && targetLength != 0){
        //下载完成
        if ([self.delegate respondsToSelector:@selector(audioPlayer:downloadCompleted:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate audioPlayer:self downloadCompleted:[self.dataBuff copy]];
            });
        }
        _download = YES;
    }
}

#pragma mark - 属性SET

- (void)setTimer:(NSTimer *)timer {
    [_timer invalidate];
    _timer = timer;
}

#pragma mark - 属性GET

- (NSURLSession *)session {
    if (!_session) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    }
    return _session;
}

- (NSURLSessionDataTask *)task {
    if (!_task) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url];
        _task = [self.session dataTaskWithRequest:request];
    }
    return _task;
}

- (NSMutableData *)dataBuff {
    if (!_dataBuff) {
        _dataBuff = [NSMutableData data];
    }
    return _dataBuff;
}

@end
