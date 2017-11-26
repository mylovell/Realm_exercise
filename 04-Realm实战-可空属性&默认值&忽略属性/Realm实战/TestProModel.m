//
//  TestProModel.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import "TestProModel.h"

@implementation TestProModel

// 强制要求某个属性非空，如果再次赋值nil则报错
// 设置非空属性
+(NSArray<NSString *> *)requiredProperties {
    return @[@"name"];
}

// Specify default values for properties
// 设置默认值
+ (NSDictionary *)defaultPropertyValues
{
    return @{@"name": @"sz"};
}

// Specify properties to ignore (Realm won't persist these)
// 设置忽略属性，不予以存储的属性
+ (NSArray *)ignoredProperties
{
    return @[@"weight"];
}

@end
