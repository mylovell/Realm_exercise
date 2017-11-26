//
//  RelationStu.h
//  Realm实战
//
//  Created by 王顺子 on 17/2/9.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>
#import "RelationDog.h"
#import "RelationCat.h"

@interface RelationStu : RLMObject

@property int stuNum;
@property NSString *stuName;
//@property RelationDog *toOneDog;
@property RLMArray <RelationDog *><RelationDog> *dogs;
@property RLMArray <RelationCat *><RelationCat> *cats;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<RelationStu *><RelationStu>
RLM_ARRAY_TYPE(RelationStu)
