//
//  FQAppEnvironment.h
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/26.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQAppEnvironment : NSObject

#pragma mark - Version
/**
 获取当前app大版本号，如：1.0
 */
+ (NSString *)version;

/**
 获取当前build版本号，如：1
 */
+ (NSString *)build;

/**
 获取完全版本号，如：1.0 build:1
 */
+ (NSString *)fullVersion;


#pragma mark - AppInfo
/**
 获取当前国家码，获取失败时，默认返回"US"    如：CN
 */
+ (NSString *)countryCode;

/**
 获取当前语言编码，失败时默认返回"en"   如：zh
 */
+ (NSString *)languageCode;

/**
 获取当前APP显示的名字 如：微信
 */
+ (NSString *)appName;

/**
 是否处于TestFlight
 */
+ (BOOL)isTestFlight;

/**
 是否来自appstore版本
 */
+ (BOOL)isAppStore;

@end
