//
//  基本的模型操作.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/8.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "XMGStu.h"

@interface ModelOption : XCTestCase

@end

@implementation ModelOption

- (void)setUp {
    [super setUp];

    // 升级数据库
   RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
   config.schemaVersion = 1;
    [config setMigrationBlock:^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        if (oldSchemaVersion < 1) {
            NSLog(@"数据库结构自动更新了");
            static int i = 0;
            [migration enumerateObjects:@"XMGStu" block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
                newObject[@"stuNum"] = @(i++);
            }];

        }
    }];

    [RLMRealmConfiguration setDefaultConfiguration:config];
    [RLMRealm defaultRealm];

}

- (void)testSaveModel {

//    XMGStu *stu = [[XMGStu alloc] initWithValue:@{@"name": @"zhangsan", @"age": @18}];
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 方式1:
//    [realm beginWriteTransaction];
//    [realm addObject:stu];
//    [realm commitWriteTransaction];

    // 方式2:
//    [realm transactionWithBlock:^{
//        [realm addObject:stu];
//    }];

    // 方式3:
    [realm transactionWithBlock:^{
//        [XMGStu createInRealm:realm withValue:@{@"name": @"zhangsan2", @"age": @28, @"stuNum": @1}];
    }];



}


- (void)testUpdateModel {
    XMGStu *stu = [[XMGStu alloc] initWithValue:@{@"name": @"xx", @"age": @18, @"stuNum": @1}];
    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm transactionWithBlock:^{
//        [realm addObject:stu];
//    }];

//    RLMResults *results = [XMGStu objectsWhere:@"name = '李四'"];
//    XMGStu *stu = results.firstObject;

//    [realm transactionWithBlock:^{
//        [realm addOrUpdateObject:stu];
//    }];

    [realm transactionWithBlock:^{
        [XMGStu createOrUpdateInRealm:realm withValue:@{@"name": @"xxxxxx", @"age": @33, @"stuNum":@3}];
    }];

}


- (void)testDeleteModel {

    RLMResults *results = [XMGStu objectsWhere:@"name = '王五'"];
    XMGStu *stu = results.firstObject;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteObject:stu];
    }];


}

- (void)testQueryModel {

    RLMResults *results = [XMGStu objectsWhere:@"age > 18"];
    for (XMGStu *stu in results) {
        NSLog(@"%@", stu);
    }

//    RLMResults *results2 = [results objectsWhere:@"age = 28"];
//    for (XMGStu *stu in results2) {
//        NSLog(@"%@", stu);
//    }
}



@end
