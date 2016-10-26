//
//  AppConfiguration.m
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/26.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "AppConfiguration.h"

NSString * const kLifeCycleDidFinishLaunchingWithOptions = @"didFinishLaunchingWithOptions";
NSString * const kLifeCycleDidEnterBackground = @"didEnterBackground";
NSString * const kLifeCycleWillEnterForeground = @"willEnterForeground";
NSString * const kLifeCycleDidBecomeActive = @"didBecomeActive";
NSString * const kLifeCycleRemoteNotification = @"remoteNotification";
NSString * const kLifeCycleWillTerminate = @"willTerminate";
NSString * const kLifeCycleOpenURL = @"openURL";

@implementation AppConfiguration

static AppConfiguration *_instance;

+ (instancetype)sharedConfig {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

#pragma mark - Config
- (void)loadConfig:(NSString *)configFileName {
    NSMutableArray *components = [configFileName componentsSeparatedByString:@"."].mutableCopy;
    NSString *type = [components lastObject];
    [components removeLastObject];
    NSString *name = [components componentsJoinedByString:@"."];
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    if (path != nil) {
        NSDictionary <NSString *, id>*configDic = [NSDictionary dictionaryWithContentsOfFile:path];
        NSLog(@"%@", configDic);
    }
}

@end
