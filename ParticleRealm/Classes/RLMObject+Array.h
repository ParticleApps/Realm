//
//  Realm+Array.h
//  Zuting
//
//  Created by Stephen Silber on 6/22/16.
//  Copyright © 2016 Rocco Del Priore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

#pragma mark - Realm Value Model

@interface RealmString : RLMObject

@property NSString *string_value;

@end

@interface RealmInt : RLMObject

@property NSInteger int_value;

@end

RLM_ARRAY_TYPE(RealmString)
RLM_ARRAY_TYPE(RealmInt)

@interface NSArray (Realm)

- (NSArray *)realmIntegerValue;

- (NSArray *)integerArrayValue;

- (NSArray *)realmStringValue;

@end
