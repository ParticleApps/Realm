
//
//  RLMResults+Array.m
//  Zuting
//
//  Created by Rocco Del Priore on 8/15/16.
//  Copyright © 2016 Rocco Del Priore. All rights reserved.
//

#import "RLMResults+Array.h"

@implementation RLMResults (PCExtensions)

- (NSArray *)arrayValue {
    NSMutableArray *array = [NSMutableArray new];
    for (RLMObject *object in self) {
        [array addObject:object];
    }
    return array;
}

@end
