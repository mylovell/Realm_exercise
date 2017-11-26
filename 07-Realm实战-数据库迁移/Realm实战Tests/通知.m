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

- (void)setUp {
    [super setUp];

//    RLMRealm *realm = [RLMRealm defaultRealm];
//    self.token = [realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
//        NSLog(@"接收到变更通知--%@", notification);
//    }];
//
//    [self.token stop];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {

    NoticeModel *noticeM = [[NoticeModel alloc] initWithValue:@{@"num": @1, @"name": @"sz"}];

    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm transactionWithBlock:^{
//        [realm addObject:noticeM];
//    }];

    RLMResults *res = [NoticeModel allObjects];
    self.token = [res addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        NSLog(@"xxxxxx---%@--%@", change, results);
    }];


//    NoticeModel *noticeM = res.firstObject;
    [realm transactionWithBlock:^{
        [realm addObject:noticeM];
    }];

    [realm transactionWithBlock:^{
        [realm deleteObject:noticeM];
    }];

}


@end
