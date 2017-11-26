//
//  通知.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NoticeModel.h"

@interface Notice : XCTestCase

@property RLMNotificationToken *token;

@end

@implementation Notice
//调用每一个方法之前调用，用于初始化一些数据
- (void)setUp {
    [super setUp];
    
    NSLog(@"HomeDirectory:%@",NSHomeDirectory());
//    // 1、realm数据库添加通知，发生操作时候有通知
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    self.token = [realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
//        // RLMNotification 就是个字符串
//        NSLog(@"接收到变更通知--%@", realm);
//        NSLog(@"notification:%@",notification);
//        NSLog(@"--------------------------------");
//    }];
//
//    [self.token stop];

}


// 每一个方法调用完之后，调用这个方法，可用于释放一些东西
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // 移除通知
    [self.token stop];
    [super tearDown];
}


// 这里面做相应的处理
- (void)testInsert {

    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults *res = [NoticeModel allObjects];
    // token必须要强引用的
    // 2、结果集添加通知
    self.token = [res addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        /*
            可以监听到发生变化的结果集results 和 产生的是什么变化change（增、删、改、查）
            change中有三个数组，insertions、modifications、deletions，如果没有发生对应的改变，则该数据为空数组。
            change中的数组元素含义：表示第几个元素发生了变化
         */
        
        /*插入了从第0到第4个
        change.insertions:(
                           0,
                           1,
                           2,
                           3,
                           4
                           )
         */
        NSLog(@"\nchange.insertions:%@\nchange.modifications:%@\nchange.deletions:%@\n",change.insertions,change.modifications,change.deletions);
        NSLog(@"results:%@",results);
        
    }];
    
    
    
    NoticeModel *noticeM = [[NoticeModel alloc] initWithValue:@{@"num": @0, @"name": @"sz0",@"mainKey":@0}];
    NoticeModel *noticeM1 = [[NoticeModel alloc] initWithValue:@{@"num": @1, @"name": @"sz1",@"mainKey":@1}];
    NoticeModel *noticeM2 = [[NoticeModel alloc] initWithValue:@{@"num": @2, @"name": @"sz2",@"mainKey":@2}];
    NoticeModel *noticeM3 = [[NoticeModel alloc] initWithValue:@{@"num": @3, @"name": @"sz3",@"mainKey":@3}];
    
    [realm transactionWithBlock:^{
        [realm addObject:noticeM];
        [realm addObject:noticeM1];
        [realm addObject:noticeM2];
        [realm addObject:noticeM3];
    }];
    
    
    
    
    //  deletion，删除一个，change中返回的是 insertions一个位置，deletions是两个位置
    //  也就是说，删除一条数据，发生了三个动作，两个delete动作和一个insert动作
    [realm transactionWithBlock:^{
        [realm deleteObject:[res objectAtIndex:1]];
    }];
    
    
    
    
    // modification，注意：修改数据，必须要实现模型类中实现 + (NSString *)primaryKey 方法，提供主键
    NoticeModel*model = res.firstObject;
    [realm transactionWithBlock:^{
        model.name = @"wahaha";// 注意：修改属性的过程必须要放在事务中，否则报错
        [realm addOrUpdateObject:model];
    }];

    
}





@end


