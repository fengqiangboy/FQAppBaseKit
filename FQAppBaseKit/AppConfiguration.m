//
//  AppConfiguration.m
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/26.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "AppConfiguration.h"
#import "FQAppLifeCycleItem.h"

NSString * const kLifeCycleDidFinishLaunchingWithOptions = @"didFinishLaunchingWithOptions";
NSString * const kLifeCycleDidEnterBackground = @"didEnterBackground";
NSString * const kLifeCycleWillEnterForeground = @"willEnterForeground";
NSString * const kLifeCycleDidBecomeActive = @"didBecomeActive";
NSString * const kLifeCycleRemoteNotification = @"remoteNotification";
NSString * const kLifeCycleWillTerminate = @"willTerminate";
NSString * const kLifeCycleOpenURL = @"openURL";

NSString * const kConfigKeyLifeCycle = @"lifecycle";
NSString * const kConfigKeyCustom = @"custom";

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

#pragma mark - Get
- (NSMutableDictionary *)lifeCycleConfig {
    if (!_lifeCycleConfig) {
        _lifeCycleConfig = @{}.mutableCopy;
    }
    
    return _lifeCycleConfig;
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
        if (configDic != nil) {
            [self loadConfigDic:configDic];
        }
    }
}

- (void)loadConfigDic:(NSDictionary <NSString *, id>*)configDic {
    NSDictionary <NSString *, id>*lifeCycleDic = [configDic objectForKey:kConfigKeyLifeCycle];
    NSDictionary <NSString *, id>*customDic = [configDic objectForKey:kConfigKeyCustom];
    if (lifeCycleDic != nil) {
        [self loadLifeCycleDic:lifeCycleDic];
    }
    
    if (customDic != nil) {
        [self loadCustomConfig:customDic];
    }
    
}

- (void)loadLifeCycleDic:(NSDictionary <NSString *, id>*)lifeCycleDic {
    
    
    [lifeCycleDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSArray * itemArray, BOOL * _Nonnull stop) {
        
        NSMutableArray <FQAppLifeCycleItem *>*items = @[].mutableCopy;
        
        [itemArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            FQAppLifeCycleItem *item = [[FQAppLifeCycleItem alloc] initWithDictionary:obj];
            if (item != nil) {
                [items addObject:item];
            }
            
            NSLog(@"load config: key: %@ items: %@", key, items);
        }];
        
        [self.lifeCycleConfig setObject:items forKey:key];
    }];
    
    
}

- (void)loadCustomConfig:(NSDictionary <NSString *, id>*)lifeCycleDic {
    
}

@end
