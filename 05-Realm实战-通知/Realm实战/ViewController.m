//
//  ViewController.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/8.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "NoticeModel.h"

@interface ViewController ()

@property (nonatomic ,strong)RLMNotificationToken *token;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"HomeDirectory:%@",NSHomeDirectory());
}

- (IBAction)myRealm {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    //    [realm transactionWithBlock:^{
    //        [realm addObject:noticeM];
    //    }];
    
    RLMResults *res = [NoticeModel allObjects];
    // token必须要强引用的
    // 结果集添加通知
    self.token = [res addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        // 可以监听到发生变化的结果集results 和 产生的是什么变化change（增、删、改、查）
        
        NSLog(@"change.insertions:%@",change.insertions);
        NSLog(@"change.modifications:%@",change.modifications);
        NSLog(@"change.deletions:%@",change.deletions);
        NSLog(@"------------------------------------------------");
        // 表示变化的位置，比如第0个、第1个
//        if (change.insertions.count > 0) {
//            NSLog(@"插入了insertions:%@",change.insertions);
//        } else if (change.modifications.count > 0) {
//            NSLog(@"修改了modifications:%@",change.modifications);
//        } else if (change.deletions.count > 0) {
//            NSLog(@"删除了deletions:%@",change.deletions);
//        }
//        NSLog(@"------------------------------------------------");
        NSLog(@"results：%@",results);
        NSLog(@"------------------------------------------------");
    }];
    
    
    
    NoticeModel *noticeM = [[NoticeModel alloc] initWithValue:@{@"num": @1, @"name": @"sz0",@"mainKey":@0}];
    NoticeModel *noticeM1 = [[NoticeModel alloc] initWithValue:@{@"num": @11, @"name": @"sz1",@"mainKey":@1}];
    NoticeModel *noticeM2 = [[NoticeModel alloc] initWithValue:@{@"num": @22, @"name": @"sz2",@"mainKey":@2}];
    NoticeModel *noticeM3 = [[NoticeModel alloc] initWithValue:@{@"num": @33, @"name": @"sz3",@"mainKey":@3}];
    NoticeModel *noticeM4 = [[NoticeModel alloc] initWithValue:@{@"num": @44, @"name": @"sz4",@"mainKey":@4}];
    
    [realm transactionWithBlock:^{
        [realm addObject:noticeM];
        [realm addObject:noticeM1];
        [realm addObject:noticeM2];
        [realm addObject:noticeM3];
        [realm addObject:noticeM4];
    }];
    
    //    [realm transactionWithBlock:^{
    //        [realm addObject:noticeM1];
    //    }];
    //
    //    [realm transactionWithBlock:^{
    //        [realm addObject:noticeM2];
    //        [realm addObject:noticeM3];
    //    }];
    
}


// 删除第一个，由最后一个来填充，所以通知情况为：insertion第一个位置，deletion第一个和第后一个位置
- (IBAction)deleteRealm {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults *res = [NoticeModel allObjects];
    [realm transactionWithBlock:^{
        [realm deleteObject:res.firstObject];
    }];
    NSLog(@"res.delete:%@",res);
}

// 修改数据，必须要实现模型类中实现 + (NSString *)primaryKey 方法，提供主键
- (IBAction)modifyRealm {
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults *res = [NoticeModel allObjects];
    NoticeModel*model = res.firstObject;
    
    [realm transactionWithBlock:^{
        model.name = @"wahaha";// 修改属性的过程必须要放在事务中
        [realm addOrUpdateObject:model];
    }];
    NSLog(@"res.modify:%@",res);
    
}

@end
