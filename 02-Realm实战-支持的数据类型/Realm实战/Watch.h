//
//  Watch.h
//  Realm实战
//
//  Created by Feng Luo on 2017/11/22.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>

@interface Watch : RLMObject

@property NSInteger watchNumber;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Watch *><Watch>
RLM_ARRAY_TYPE(Watch)
