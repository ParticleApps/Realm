//
//  RLMResults+Array.h
//  Zuting
//
//  Created by Rocco Del Priore on 8/15/16.
//  Copyright © 2016 Rocco Del Priore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RLMResults (PCExtensions)

- (NSArray *)arrayValue;

@end
