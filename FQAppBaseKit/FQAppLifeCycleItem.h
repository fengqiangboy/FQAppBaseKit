//
//  FQAppLifeCycleItem.h
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/27.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FQAppLifeCycleProtocol <UIApplicationDelegate>

@end

@interface FQAppLifeCycleItem : NSObject

@property (nonatomic, strong) id <FQAppLifeCycleProtocol> object;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
