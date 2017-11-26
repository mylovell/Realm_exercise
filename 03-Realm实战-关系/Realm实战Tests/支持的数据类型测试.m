//
//  支持的数据类型测试.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/8.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "DataTypeTest.h"

@interface DataType : XCTestCase

@end

@implementation DataType

- (void)testExample {
    
    DataTypeTest *test = [[DataTypeTest alloc] init];
    test.B1 = YES;
    test.b2 = false;
    test.i = 10;
    test.ite = 22;
    test.l = 33;
    test.ll = 44;
    test.f = 22.2;
    test.d = 33.33;
    test.str = @"xx";
    test.date = [NSDate date];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"x.jpg" ofType:nil];
    test.data = [NSData dataWithContentsOfFile:path];
    test.num = @22;

    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:test];
    }];



    RLMResults *res = [DataTypeTest allObjects];

    for (DataTypeTest *test in res) {
        NSLog(@"%@", test);
    }



}



@end
