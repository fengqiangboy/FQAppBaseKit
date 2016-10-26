//
//  FQAppEnvironment.m
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/26.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "FQAppEnvironment.h"

@implementation FQAppEnvironment

+ (NSString *)version {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)build {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (NSString *)fullVersion {
    return [NSString stringWithFormat:@"%@ build:%@", [self version], [self build]];
}

+ (NSString *)countryCode {
    NSString *countryCode = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
    if (countryCode.length == 0) {
        countryCode = @"US";
    }
    
    return countryCode;
}

+ (NSString *)languageCode {
    NSString *languageCode = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
    if (languageCode.length == 0) {
        languageCode = @"en";
    }
    
    return languageCode;
}

+ (NSString *)appName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

+ (BOOL)isTestFlight {
    return [self isAppStoreReceiptSandbox] && ![self hasEmbeddedMobileProvision];
}

+ (BOOL)isAppStore {
    if ([self isAppStoreReceiptSandbox] || [self hasEmbeddedMobileProvision]) {
        return NO;
    }
    
    return YES;
}

+ (BOOL)isAppStoreReceiptSandbox {
    BOOL ret = NO;
    NSURL *appStoreReceiptURL = [NSBundle mainBundle].appStoreReceiptURL;
    if (appStoreReceiptURL != nil) {
        ret = [appStoreReceiptURL.lastPathComponent isEqualToString:@"sandboxReceipt"];
    }
    
    return ret;
}

+ (BOOL)hasEmbeddedMobileProvision {
    return [[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"] != nil;
}

@end
