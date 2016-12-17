//
//  Realm+Array.m
//  Zuting
//
//  Created by Stephen Silber on 6/22/16.
//  Copyright © 2016 Rocco Del Priore. All rights reserved.
//

#import <Realm/Realm.h>
#import "RLMObject+Array.h"

@implementation RealmString

@end

@implementation RealmInt

@end

@implementation NSArray (Realm)

- (NSArray *)realmIntegerValue {
    
    if (![self.firstObject isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    NSMutableArray *realmIntegerValues = [NSMutableArray arrayWithCapacity:self.count];
    
    for (NSNumber *value in self) {
        RealmInt *integer = [[RealmInt alloc] init];
        integer.int_value = [value integerValue];
        [realmIntegerValues addObject:integer];
    }
    
    return realmIntegerValues;
}

- (NSArray *)realmStringValue {
    if (![self.firstObject isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSMutableArray *relamStringValues = [NSMutableArray arrayWithCapacity:self.count];
    
    for (NSString *value in self) {
        RealmString *string = [[RealmString alloc] init];
        string.string_value = value;
        [relamStringValues addObject:string];
    }
    
    return relamStringValues;
}

- (NSArray *)integerArrayValue {
    if (![self.firstObject isKindOfClass:[RealmInt class]]) {
        return nil;
    }
    
    NSMutableArray *realmIntegerValues = [NSMutableArray arrayWithCapacity:self.count];
    
    for (RealmInt *value in self) {
        NSNumber *number  = @(value.int_value);
        [realmIntegerValues addObject:number];
    }
    
    return realmIntegerValues;
}

@end
