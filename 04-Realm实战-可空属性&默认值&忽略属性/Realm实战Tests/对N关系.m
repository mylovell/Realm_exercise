//
//  对N关系.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RelationStu.h"

@interface TONRelation: XCTestCase

@end

@implementation TONRelation



- (void)testToOne {

//    RLMResults *res = [RelationStu allObjects];
//    for (RelationStu *stu in res) {
//        NSLog(@"%@", stu.toOneDog);
//    }


    RelationStu *stu = [[RelationStu alloc] init];
    stu.stuNum = 2;
    stu.stuName = @"王二小";

    RelationDog *dog = [[RelationDog alloc] init];
    dog.dogNum = 3;
    dog.dogName = @"旺财";

    [stu.dogs addObject:dog];

    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];


}


- (void)testToMany {

    RelationStu *stu = [[RelationStu alloc] init];
    stu.stuNum = 2;
    stu.stuName = @"王二小";

    RelationDog *dog1 = [[RelationDog alloc] init];
    dog1.dogNum = 3;
    dog1.dogName = @"旺财";

    [stu.dogs addObject:dog1];

    RelationDog *dog2 = [[RelationDog alloc] init];
    dog2.dogNum = 33;
    dog2.dogName = @"土豆";

    [stu.dogs addObject:dog2];

    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];


}


- (void)testReverseRealtion {

    RLMResults *res = [RelationDog allObjects];
    for (RelationDog *dog in res) {
        NSLog(@"%@", dog.master);
    }


}


@end
