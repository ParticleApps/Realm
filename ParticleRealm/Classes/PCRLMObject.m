//
//  PCRLMObject.m
//  Pods
//
//  Created by Rocco Del Priore on 12/17/16.
//
//

#import "PCRLMObject.h"

NSString *const kUnusedIntegerKey = @"pcUnsuedIntegerKey";
NSString *const kUnusedStringKey = @"pcUnsuedStringKey";

@interface PCRLMObject ()

@property (nonatomic) NSInteger uniqueId;
@property (nonatomic) NSString *uniqueStringId;

@end

@implementation PCRLMObject

+ (NSDictionary *)preprocessedJSON:(NSDictionary *)json {
    NSMutableDictionary *mutable = [json mutableCopy];
    mutable[kUnusedIntegerKey] = @(-1);
    mutable[kUnusedStringKey] = @"";
    return mutable;
}

+ (NSDictionary *)JSONInboundMappingDictionary {
    return @{
             kUnusedIntegerKey : @"uniqueId",
             kUnusedStringKey : @"uniqueStringId"
             };
}

+ (NSDictionary *)JSONOutboundMappingDictionary {
    return @{
             @"uniqueId" : kUnusedIntegerKey,
             @"uniqueStringId" : kUnusedStringKey
             };
}

+ (NSString *)primaryKey {
    return @"uniqueId";
}

@end
