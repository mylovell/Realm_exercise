//
//  TestProModel.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import "TestProModel.h"

@implementation TestProModel

//+(NSArray<NSString *> *)requiredProperties {
//    return @[@"name"];
//}

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"name": @"sz"};
}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties
{
    return @[@"name"];
}

@end
