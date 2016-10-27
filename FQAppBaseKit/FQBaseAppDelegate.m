//
//  FQBaseAppDelegate.m
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/26.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "FQBaseAppDelegate.h"
#import "AppConfiguration.h"
#import "FQAppLifeCycleItem.h"

@interface FQBaseAppDelegate ()

@property (nonatomic, strong) AppConfiguration *appDelegateConfig;

@end

@implementation FQBaseAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.appDelegateConfig = [AppConfiguration sharedConfig];
    [self.appDelegateConfig loadConfig:@"config.plist"];
    
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleDidFinishLaunchingWithOptions];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
                BOOL ret = [item.object application:application didFinishLaunchingWithOptions:launchOptions];
                if (ret == NO) {
                    return NO;
                }
            }
        }
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleDidEnterBackground];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(applicationDidEnterBackground:)]) {
                [item.object applicationDidEnterBackground:application];
            }
        }
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleWillEnterForeground];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(applicationWillEnterForeground:)]) {
                [item.object applicationWillEnterForeground:application];
            }
        }
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleDidBecomeActive];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(applicationDidBecomeActive:)]) {
                [item.object applicationDidBecomeActive:application];
            }
        }
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleWillTerminate];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(applicationWillTerminate:)]) {
                [item.object applicationWillTerminate:application];
            }
        }
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleRemoteNotification];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
                [item.object application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
            }
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleRemoteNotification];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]) {
                [item.object application:application didFailToRegisterForRemoteNotificationsWithError:error];
            }
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleRemoteNotification];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(application:didReceiveRemoteNotification:)]) {
                [item.object application:application didReceiveRemoteNotification:userInfo];
            }
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleRemoteNotification];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)]) {
                [item.object application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
            }
        }
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    BOOL handled = NO;
    
    NSArray *lifeCycleItems = [self.appDelegateConfig.lifeCycleConfig objectForKey:kLifeCycleOpenURL];
    
    if (lifeCycleItems != nil) {
        for (FQAppLifeCycleItem *item in lifeCycleItems) {
            if ([item.object respondsToSelector:@selector(application:openURL:options:)]) {
                BOOL ret = [item.object application:app openURL:url options:options];
                if (ret == YES) {
                    handled = YES;
                }
            }
        }
    }
    
    return handled;
}

@end
