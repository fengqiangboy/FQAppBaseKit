//
//  AppConfiguration.h
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/26.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import <Foundation/Foundation.h>


FOUNDATION_EXPORT NSString * const kLifeCycleDidFinishLaunchingWithOptions;
FOUNDATION_EXPORT NSString * const kLifeCycleDidEnterBackground;
FOUNDATION_EXPORT NSString * const kLifeCycleWillEnterForeground;
FOUNDATION_EXPORT NSString * const kLifeCycleDidBecomeActive;
FOUNDATION_EXPORT NSString * const kLifeCycleRemoteNotification;
FOUNDATION_EXPORT NSString * const kLifeCycleWillTerminate;
FOUNDATION_EXPORT NSString * const kLifeCycleOpenURL;

@interface AppConfiguration : NSObject

+ (instancetype)sharedConfig;

- (void)loadConfig:(NSString *)configFileName;

@end
