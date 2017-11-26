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
    
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        // 如果weight属性没有赋值，在这里会报错。
        [realm addObject:testM];
    }];

    RLMResults *testProModels = [TestProModel allObjects];
    NSLog(@"testProModels:%@",testProModels);

}

- (void)testIgnore {

    // 1. readOnly 会自动忽略
//    testM.babyName = @"feng";

    // 2. 实现协议方法
    TestProModel *testM = [[TestProModel alloc] init];
    testM.num = 16;
//    testM.weight = @"91";
//    testM.name = @"luo";// 有默认名字
    

    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:testM];
    }];
    
//    RLMResults *results = [TestProModel allObjects];
//    NSLog(@"results:%@",results);
//    for (TestProModel *model in results) {
//        NSLog(@"name:%@",model.name);
//    }
    
}


@end
