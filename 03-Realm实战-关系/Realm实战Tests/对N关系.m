//
//  对N关系.m
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RelationStu.h"

@interface TONRelation: XCTestCase

@end

@implementation TONRelation

// setUp：执行所有方法之前，先调用setup，做一些初始化的工作
- (void)setUp {
    [super setUp];
    NSLog(@"HomeDirectory:%@",NSHomeDirectory());
    
}


- (void)testToOne {

    // 对一关系：RelationStu 拥有一个 RelationCat
    
//    RelationStu *stu = [[RelationStu alloc] init];
//    stu.stuNum = 2;
//    stu.stuName = @"王二小";
//
//    RelationDog *dog = [[RelationDog alloc] init];
//    dog.dogNum = 3;
//    dog.dogName = @"旺财";
//
//    [stu.dogs addObject:dog];
//
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm transactionWithBlock:^{
//        [realm addObject:stu];
//    }];
//    
//    
//    RLMResults *res = [RelationStu allObjects];
//    NSLog(@"res:%@",res);
//    for (RelationStu *stu in res) {
//        NSLog(@"%@", stu.oneCat);
//    }
    
}


- (void)testToMany {

    // 对多关系：一个RelationStu 拥有多个 RelationDog
    
    RelationStu *stu = [[RelationStu alloc] init];
    stu.stuNum = 2;
    stu.stuName = @"王二小";

    RelationDog *dog1 = [[RelationDog alloc] init];
    dog1.dogNum = 3;
    dog1.dogName = @"旺财";
//    dog1.dogKey = 0;
    [stu.dogs addObject:dog1];

    RelationDog *dog2 = [[RelationDog alloc] init];
    dog2.dogNum = 33;
    dog2.dogName = @"土豆";
//    dog2.dogKey = 1;
    [stu.dogs addObject:dog2];
    
    RelationCat *cat1 = [[RelationCat alloc] init];
    cat1.catName = @"kitty";
//    cat1.catKey = 0;
    [stu.cats addObject:cat1];
    
    
    
    RelationStu *stu1 = [[RelationStu alloc] init];
    stu.stuNum = 3;
    stu.stuName = @"吉米";
    RelationDog *dog3 = [[RelationDog alloc] init];
    dog3.dogNum = 3;
    dog3.dogName = @"dog3";
    [stu1.dogs addObject:dog3];
    RelationCat *cat2 = [[RelationCat alloc] init];
    cat2.catName = @"cat2";
    [stu1.cats addObject:cat2];
    
    
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
        [realm addObject:stu1];
    }];
    
    
    
    
    RLMResults *res = [RelationStu allObjects];
    NSLog(@"res:%@",res);
    
//    for (RelationStu *stu in res) {
//        NSLog(@"%@", stu.dogs);
//    }
    
    RelationStu *stuResult = res.firstObject;
    [realm transactionWithBlock:^{
//        stuResult.cats.firstObject.catName = @"lucky";
        stuResult.stuName = @"桑丘";
        stuResult.dogs.firstObject.dogName = @"Jack";
        
    }];
    
    NSLog(@"stuResult:%@",stuResult);
    
}


- (void)testReverseRealtion {

    RLMResults *res = [RelationDog allObjects];
    for (RelationDog *dog in res) {
        NSLog(@"%@", dog.master);
    }


}


@end
