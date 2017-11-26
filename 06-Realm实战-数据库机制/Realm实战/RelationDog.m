//
//  RelationDog.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import "RelationDog.h"

@implementation RelationDog

+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties {
    return @{
             @"master": [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"RelationStu") propertyName:@"dogs"]
             };
}


// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
