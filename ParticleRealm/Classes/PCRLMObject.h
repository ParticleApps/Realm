//
//  PCRLMObject.h
//  Pods
//
//  Created by Rocco Del Priore on 12/17/16.
//
//

#import <Realm/Realm.h>
#import "RLMObject+JSON.h"

@interface PCRLMObject : RLMObject

@property (nonatomic, readonly) NSInteger uniqueId;

@end
