//
//  可空属性&默认值&忽略属性.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "TestProModel.h"

@interface properties : XCTestCase

@end

@implementation properties


- (void)testNil {

    TestProModel *testM = [[TestProModel alloc] init];
    testM.num = 66;

    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:testM];
    }];



}

- (void)testIgnore {

    // 1. readOnly 会自动忽略

    // 2. 实现协议方法
    TestProModel *testM = [[TestProModel alloc] init];
    testM.num = 66;

    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:testM];
    }];
}


@end
