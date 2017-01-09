//
//  PCRealmObservationManager.h
//  Pods
//
//  Created by Rocco Del Priore on 1/8/17.
//
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@protocol PCRealmObserver <NSObject>
@end

@interface PCRealmObservationManager : NSObject

@property (nonatomic, readonly) NSHashTable *observers;
@property (nonatomic, readonly) RLMRealm *realm;

+ (instancetype)sharedInstance;

- (void)reloadObserver:(id<PCRealmObserver>)observer;

- (void)addObserver:(id<PCRealmObserver>)observer;

- (void)removeObserver:(id<PCRealmObserver>)observer;

@end
