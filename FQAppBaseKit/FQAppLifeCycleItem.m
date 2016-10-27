//
//  FQAppLifeCycleItem.m
//  FQAppBaseKitDemo
//
//  Created by 奉强 on 16/10/27.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "FQAppLifeCycleItem.h"
#import "OBJCObjectFactory.h"

@implementation FQAppLifeCycleItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        NSString *objStr = [dictionary objectForKey:@"object"];
        
        
        if (objStr != nil) {
            _object = [OBJCObjectFactory create:objStr];
            
        }
        
        if (_object == nil) {
            return nil;
        }
        else {
            NSAssert([_object conformsToProtocol:NSProtocolFromString(@"FQAppLifeCycleProtocol")], @"需要遵循FQAppLifeCycleProtocol协议");
        }
    }
    
    return self;
}

@end
