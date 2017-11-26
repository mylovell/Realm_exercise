//
//  测量时间.m
//  Realm实战
//
//  Created by Feng Luo on 2017/11/25.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MeasureTime : XCTestCase

@end

@implementation MeasureTime

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    


}


// 测试性能用例
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
