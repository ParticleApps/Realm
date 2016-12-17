//
//  PCRLMObject.m
//  Pods
//
//  Created by Rocco Del Priore on 12/17/16.
//
//

#import "PCRLMObject.h"


@interface PCRLMObject ()

@property (nonatomic) NSInteger uniqueId;

@end

@implementation PCRLMObject

+ (NSString *)primaryKey {
    return @"uniqueId";
}

@end
