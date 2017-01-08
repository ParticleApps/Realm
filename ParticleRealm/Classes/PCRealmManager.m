//
//  PCRealmManager.m
//  Pods
//
//  Created by Rocco Del Priore on 12/17/16.
//
//

#import "PCRealmManager.h"
#import "RLMResults+Array.h"
#import "RLMObject+Array.h"
#import "RLMObject+JSON.h"

@interface PCRealmManager ()
@property (nonatomic) RLMRealm *realm;
@end

@implementation PCRealmManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static PCRealmManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.realm = [RLMRealm defaultRealm];
    }
    return self;
}

- (NSArray <PCRLMObject *> *)addOrUpdateObjectsOfType:(Class)pcclass fromArray:(NSArray *)array removeStaleObjects:(BOOL)removeStaleObjects {
    //Declare Initial Variables
    BOOL isInWriteTransaction = self.realm.inWriteTransaction;
    NSMutableArray<RLMObject *> *values  = [NSMutableArray arrayWithCapacity:array.count];
    NSMutableArray<NSNumber *> *arrayIds = [NSMutableArray arrayWithCapacity:array.count];
    
    if (!isInWriteTransaction) {
        [self.realm beginWriteTransaction];
    }
    
    //Add Or Update Exisitng Objects
    for (NSDictionary *value in array) {
        [values addObject:[pcclass createOrUpdateInRealm:self.realm withJSONDictionary:value]];
        [arrayIds addObject:@([(PCRLMObject *)values.lastObject uniqueId])];
    }
    
    //Remove Stale Objects
    if (removeStaleObjects) {
        RLMResults<RLMObject *> *deadValues = [pcclass objectsWithPredicate:[NSPredicate predicateWithFormat:@"NOT (uniqueId IN %@)", arrayIds]];
        [self.realm deleteObjects:[deadValues arrayValue]];
    }
    
    if (!isInWriteTransaction) {
        [self.realm commitWriteTransaction];
    }
    
    return values;
}

- (PCRLMObject *)addOrUpdateObject:(NSDictionary *)dictionary class:(Class)pcclass {
    BOOL isInWriteTransaction = self.realm.inWriteTransaction;
    
    if (!isInWriteTransaction) [self.realm beginWriteTransaction];
    PCRLMObject *object = [pcclass createOrUpdateInRealm:self.realm withJSONDictionary:dictionary];
    if (!isInWriteTransaction) [self.realm commitWriteTransaction];
    
    return object;
}

@end
