//
//  数据库机制.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "NoticeModel.h"

@interface DataBase : XCTestCase

@end

@implementation DataBase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test用户机制 {
    // 不同的用户, 使用不同的数据库
    [self setDefaultRealmForUser:@"zhangsan"];

    RLMRealm *realm = [RLMRealm defaultRealm];
    NoticeModel *zhangsan = [[NoticeModel alloc] initWithValue:@{
                                                                 @"num": @123,
                                                                 @"name":@"zhangsan"
                                                                 }];
   [realm transactionWithBlock:^{
       [realm addObject:zhangsan];
   }];



}


- (void)testLisi {
    // 不同的用户, 使用不同的数据库
    [self setDefaultRealmForUser:@"lisi"];



    RLMRealm *realm = [RLMRealm defaultRealm];
    NoticeModel *zhangsan = [[NoticeModel alloc] initWithValue:@{
                                                                 @"num": @123,
                                                                 @"name":@"lisi"
                                                                 }];
    [realm transactionWithBlock:^{
        [realm addObject:zhangsan];
    }];

}

- (void)testOnlyRead {
    [self setDefaultRealmForUser:@"zhangsan"];

    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    // 使用默认的目录，但是使用用户名来替换默认的文件名
    config.readOnly = YES;
    // 将这个配置应用到默认的 Realm 数据库当中
    [RLMRealmConfiguration setDefaultConfiguration:config];
    RLMRealm *realm = [RLMRealm defaultRealm];
    NoticeModel *zhangsan = [[NoticeModel alloc] initWithValue:@{
                                                                 @"num": @123,
                                                                 @"name":@"lisi"
                                                                 }];
//    [realm transactionWithBlock:^{
//        [realm addObject:zhangsan];
//    }];
    RLMResults *res = [NoticeModel allObjects];
    for (NoticeModel *m in res) {
        NSLog(@"%@", m);
    }

}

- (void)testDelete {

    [self setDefaultRealmForUser:@"zhangsan"];

    NSFileManager *manager = [NSFileManager defaultManager];
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSArray<NSURL *> *realmFileURLs = @[
                                        config.fileURL,
                                        [config.fileURL URLByAppendingPathExtension:@"lock"],
                                        [config.fileURL URLByAppendingPathExtension:@"log_a"],
                                        [config.fileURL URLByAppendingPathExtension:@"log_b"],
                                        [config.fileURL URLByAppendingPathExtension:@"note"]
                                        ];
    for (NSURL *URL in realmFileURLs) {
        NSError *error = nil;
        [manager removeItemAtURL:URL error:&error];
        if (error) {
            // 处理错误
        }
    }
}


- (void)setDefaultRealmForUser:(NSString *)username {

    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    // 使用默认的目录，但是使用用户名来替换默认的文件名
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]
                       URLByAppendingPathComponent:username]
                      URLByAppendingPathExtension:@"realm"];
    // 将这个配置应用到默认的 Realm 数据库当中
    [RLMRealmConfiguration setDefaultConfiguration:config];
}


@end
