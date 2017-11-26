//
//  数据库迁移.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DataMigration.h"
#import <Foundation/Foundation.h>


@interface DataBaseMigration : XCTestCase

@end

@implementation DataBaseMigration

- (void)setUp {
    [super setUp];
    
    NSLog(@"HomeDirectory:%@",NSHomeDirectory());
    // 迁移数据结构
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];

    // 1. 升级一个版本
    int newVersion = 5;
    config.schemaVersion = newVersion;

    // 2. 设置迁移block
    [config setMigrationBlock:^(RLMMigration *migration, uint64_t oldSchemaVersion){
        
//        if (oldSchemaVersion < newVersion) {

            NSLog(@"以下什么都不用做，数据结构会自动迁移");

            // 改名
//            [migration renamePropertyForClass:DataMigration.className oldName:@"fullName" newName:@"allName"];

            // 数据迁移
//            [migration enumerateObjects:@"DataMigration" block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
            
                
                // 这里不能用类方法合并字符串，否则报错
//                newObject[@"fullName"] = [oldObject[@"firstName"] stringByAppendingString:oldObject[@"lastName"]];
                
                // 这种方式也可以完成改名的迁移，但效率低
                // newObject[@"sum2"] = oldObject[@"sum"];
//            }];
//        }
    }];

    // 3. 重新设置默认配置
    [RLMRealmConfiguration setDefaultConfiguration:config];

    // 4. 立即生效
    RLMRealm *realm = [RLMRealm defaultRealm];

    NSLog(@"setUp - schemaVersion:%llu",realm.configuration.schemaVersion);

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// 插入数据
- (void)testInsertion {
    
    DataMigration *mode = [[DataMigration alloc] init];
    mode.firstName = @"luo";
    mode.lastName = @"feng";
    mode.number = 30;
    
    DataMigration *mode1 = [[DataMigration alloc] init];
    mode1.firstName = @"luo1";
    mode1.lastName = @"feng1";
    mode1.number = 31;
    
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:mode];
        [realm addObject:mode1];
    }];
    
    
    RLMResults *results = [DataMigration allObjects];
    NSLog(@"results:%@",results);
    
    NSLog(@"schemaVersion:%llu",realm.configuration.schemaVersion);
}


- (void)testDataMigration {
    
    [RLMRealm defaultRealm];
    
    RLMResults *results = [DataMigration allObjects];
    NSLog(@"results:%@",results);
    
}

- (void)testQuery {
    
    
}

#pragma mark - 多版本增量式迁移
// 多版本增量式迁移代码示范
- (void)testSeveralMigration {
    
    // 迁移数据结构
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    // 1. 升级一个版本
    int newVersion = 5;
    config.schemaVersion = newVersion;
    
    // 2. 检测到schemaVersion增加，调用以下block，开始数据库迁移升级
    [config setMigrationBlock:^(RLMMigration *migration, uint64_t oldSchemaVersion){
        
        // enumerateObjects:block: 遍历了存储在 Realm 文件中的每一个“Person”对象
        [migration enumerateObjects:DataMigration.className block:^(RLMObject *oldObject, RLMObject *newObject) {
            
            // 数据库版本会逐步升级
            
            
            // 只有当 Realm 数据库的架构版本为 0 的时候，才添加 “fullName” 属性
            if (oldSchemaVersion < 1) {
                newObject[@"fullName"] = [NSString stringWithFormat:@"%@ %@",
                                          oldObject[@"firstName"],
                                          oldObject[@"lastName"]];
            }
            
            // 只有当 Realm 数据库的架构版本为 0 或者 1 的时候，才添加“email”属性
            if (oldSchemaVersion < 2) {
                newObject[@"email"] = @"";
            }
            
            // 升级到3
            if (oldSchemaVersion < 3) {
                // coding...重命名、数据迁移。。。
            }
            
            // 升级到4
            if (oldSchemaVersion < 4) {
                // coding...
            }
            
            // ...
            
        }];
    
    
    }];
    
}

#pragma mark - 性能测试
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
