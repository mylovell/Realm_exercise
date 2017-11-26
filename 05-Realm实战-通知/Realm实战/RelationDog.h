//
//  RelationDog.h
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>

@interface RelationDog : RLMObject

@property int dogNum;
@property NSString *dogName;

@property (readonly) NSString *autoIgnore;
@property (readonly) RLMLinkingObjects *master;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<RelationDog *><RelationDog>
RLM_ARRAY_TYPE(RelationDog)
