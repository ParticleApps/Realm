//
//  PCRLMObject.h
//  Pods
//
//  Created by Rocco Del Priore on 12/17/16.
//
//

#import <Realm/Realm.h>
#import "RLMObject+JSON.h"

extern NSString *const kUnusedIntegerKey;
extern NSString *const kUnusedStringKey;

@interface PCRLMObject : RLMObject

@property (nonatomic, readonly) NSInteger uniqueId;
@property (nonatomic, readonly) NSString *uniqueStringId;

+ (NSDictionary *)JSONInboundMappingDictionary;
+ (NSDictionary *)JSONOutboundMappingDictionary;
+ (NSDictionary *)preprocessedJSON:(NSDictionary *)dictionary;

@end
