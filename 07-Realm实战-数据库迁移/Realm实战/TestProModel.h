//
//  TestProModel.h
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>

@interface TestProModel : RLMObject

@property int num;
@property NSString *name;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<TestProModel *><TestProModel>
RLM_ARRAY_TYPE(TestProModel)
