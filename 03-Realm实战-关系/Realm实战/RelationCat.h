//
//  RelationCat.h
//  Realm实战
//
//  Created by Feng Luo on 2017/11/22.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>

@interface RelationCat : RLMObject
@property NSString *catName;
//@property int catKey;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<RelationCat *><RelationCat>
RLM_ARRAY_TYPE(RelationCat)
