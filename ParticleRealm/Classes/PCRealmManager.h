//
//  PCRealmManager.h
//  Pods
//
//  Created by Rocco Del Priore on 12/17/16.
//
//

#import <Realm/Realm.h>
#import <Foundation/Foundation.h>

#import "PCRLMObject.h"

@interface PCRealmManager : NSObject

+ (instancetype)sharedInstance;

- (NSArray <PCRLMObject *> *)addOrUpdateObjectsOfType:(Class)pcclass fromArray:(NSArray *)array removeStaleObjects:(BOOL)removeStaleObjects;

- (PCRLMObject *)addOrUpdateObject:(NSDictionary *)dictionary class:(Class)pcclass;

@end
