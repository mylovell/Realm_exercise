//
//  XMGStu.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/8.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import "XMGStu.h"

@implementation XMGStu


+ (NSString *)primaryKey {
    return @"stuNum";
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



- (NSString *)description {
    return [NSString stringWithFormat:@"%zd-%@-%zd", self.stuNum, self.name, self.age];
}

@end
