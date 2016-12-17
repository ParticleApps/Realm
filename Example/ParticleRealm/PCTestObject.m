//
//  PCTestObject.m
//  ParticleRealm
//
//  Created by Rocco Del Priore on 12/17/16.
//  Copyright © 2016 Rocco Del Priore. All rights reserved.
//

#import "PCTestObject.h"

@interface PCRLMObject ()
@property (nonatomic) NSInteger uniqueId;
@end

@interface PCTestObject ()
@property (nonatomic) NSString *testThing;
@end

@implementation PCTestObject

- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary {
    self = [super initWithJSONDictionary:dictionary];
    if (self) {
        self.uniqueId = [dictionary[@"id"] integerValue];
        self.testThing = dictionary[@"title"];
    }
    return self;
}

+ (NSString *)primaryKey {
    return @"uniqueStringId";
}

+ (NSDictionary *)JSONInboundMappingDictionary {
    NSMutableDictionary *dictionary = [[PCRLMObject JSONInboundMappingDictionary] mutableCopy];
    dictionary[@"id"] = @"uniqueStringId";
    dictionary[@"title"] = @"testThing";
    return dictionary;
}

+ (NSDictionary *)JSONOutboundMappingDictionary {
    NSMutableDictionary *dictionary = [[PCRLMObject JSONOutboundMappingDictionary] mutableCopy];
    dictionary[@"uniqueStringId"] = @"id";
    dictionary[@"testThing"] = @"title";
    return dictionary;
}

@end
