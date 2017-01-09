//
//  PCRealmObservationManager.m
//  Pods
//
//  Created by Rocco Del Priore on 1/8/17.
//
//

#import "PCRealmObservationManager.h"

@interface PCRealmObservationManager ()
@property (nonatomic) NSHashTable *observers;
@property (nonatomic) RLMRealm *realm;
@end

@implementation PCRealmObservationManager

+ (instancetype)sharedInstance {
    static PCRealmObservationManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
        
    });
    return _sharedClient;
}

- (void)reloadObserver:(id<PCRealmObserver>)observer {
    
}

- (void)addObserver:(id<PCRealmObserver>)observer {
    [self.observers addObject:observer];
}

- (void)removeObserver:(id<PCRealmObserver>)observer {
    if ([self.observers containsObject:observer]) {
        [self.observers removeObject:observer];
    }
}

@end
