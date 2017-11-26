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

// 这一坨是什么
//- (void)setUp {
//    [super setUp];
//
//    // 升级数据库
//   RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
//   config.schemaVersion = 1;
//    [config setMigrationBlock:^(RLMMigration *migration, uint64_t oldSchemaVersion) {
//        if (oldSchemaVersion < 1) {
//            NSLog(@"数据库结构自动更新了");
//            static int i = 0;
//            [migration enumerateObjects:@"XMGStu" block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
//                newObject[@"stuNum"] = @(i++);
//            }];
//
//        }
//    }];
//
//    [RLMRealmConfiguration setDefaultConfiguration:config];
//    [RLMRealm defaultRealm];
//
//}

- (void)testSaveModel {

    XMGStu *stu = [[XMGStu alloc] initWithValue:@{@"name": @"zhangsan", @"age": @27}];
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
    
    [realm transactionWithBlock:^{
        [XMGStu createInRealm:realm withValue:@{@"name": @"lovell", @"age": @20,@"stuNum":@6}];
    }];


}


- (void)testUpdateModel {
    XMGStu *stu = [[XMGStu alloc] initWithValue:@{@"name": @"xx", @"age": @19, @"stuNum": @1}];
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

    RLMRealm *realm = [RLMRealm defaultRealm];
    
    //1 删除一条数据
//    RLMResults *results = [XMGStu objectsWhere:@"name = '王五'"];
//    XMGStu *stu = results.firstObject;
//    [realm transactionWithBlock:^{
//        [realm deleteObject:stu];
//    }];
    
    //2 删除模型（类型）下的所有数据
//    RLMResults *results = [XMGStu allObjects];
//    for (XMGStu *stu in results) {
//        [realm transactionWithBlock:^{
//            [realm deleteObject:stu];
//        }];
//    }
    
    //3 删除realm下所有数据
//    [realm transactionWithBlock:^{
//        [realm deleteAllObjects];
//    }];
    
    //4 根据主键删除一条数据
//    XMGStu *stu = [XMGStu objectInRealm:realm forPrimaryKey:[XMGStu primaryKey]];
//    [realm transactionWithBlock:^{
//        [realm deleteObject:stu];
//    }];
    
    

}

- (void)testQueryModel {
    
    RLMRealm *realm = [RLMRealm defaultRealm];

    // 一旦检索之后，RLMResults将随时保持更新。
//    RLMResults *results = [XMGStu objectsWhere:@"age > 18"];
//    NSLog(@"%@", results);
//    
//    
//    XMGStu *stu = [[XMGStu alloc] initWithValue:@{@"name": @"jingmei", @"age": @21,@"stuNum":@4}];
//    [realm transactionWithBlock:^{
//        [realm addObject:stu];
//    }];
//    [realm transactionWithBlock:^{
//        [XMGStu createInRealm:realm withValue:@{@"name": @"lovell", @"age": @30,@"stuNum":@5}];
//    }];
//    NSLog(@"%@", results);
    
    
    
    // 一、查询所有
//    RLMResults *results2 = [XMGStu allObjects];
//    for (XMGStu *stu in results2) {
//        NSLog(@"%@", stu);
//    }
    
    
    
    // 二、条件查询
//    RLMResults *results3 = [results objectsWhere:@"age = 28"];
//    for (XMGStu *stu in results3) {
//        NSLog(@"%@", stu);
//    }
    
    
    
    // 三、排序
//    RLMResults <XMGStu *>*results3 = [XMGStu objectsWhere:@"name = 'lovell'"];
//    NSLog(@"results3:%@",results3);
//    // 根据 构造器RLMSortDescriptor 排序
//    // [results3 sortedResultsUsingDescriptors:(nonnull NSArray<RLMSortDescriptor *> *)];
//    // 根据某个属性排序
//    results3 = [results3 sortedResultsUsingProperty:@"age" ascending:YES];
//    NSLog(@"results3:%@",results3);
    
    
    
    // 四、链式查询（查询的基础上，二次查询，效率比sqlite高）
//    RLMResults <XMGStu *>*results4 = [XMGStu objectsWhere:@"name = 'lovell'"];
//    results4 = [results4 objectsWhere:@"age >= '29'"];// 对结果集二次查询
    
    
    
    // 五、分页（ 好处是展示多少加载多少，不要把所有的都加载到内存中，注意：realm有个属性是-延迟加载也就是懒加载 ）
    // (查询出来的结果对象是懒加载, 只有真正访问时, 才会加载相应对象, 所以, 这里的分页, 其实就是从所有集合中分页获取即可)
    RLMResults <XMGStu *>* results5 = [XMGStu allObjects];
    for (int i = 0; i < 6; i++) {
        // 这里才是加载到内存
        XMGStu *stu = results5[i];
    }
    
    
}



@end
