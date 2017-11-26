//
//  DataMigration.h
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>

@interface DataMigration : RLMObject

@property NSInteger number;
@property NSString *firstName;
@property NSString *lastName;

// 测试数据结构迁移
@property NSInteger age;
@property NSInteger age2;

// 测试数据迁移
//@property NSString *fullName;

// 改名
//@property NSString *allName;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<DataMigration *><DataMigration>
RLM_ARRAY_TYPE(DataMigration)
