//
//  XMGStu.h
//  Realm实战
//
//  Created by 王顺子 on 17/2/8.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>

@interface XMGStu : RLMObject



@property int stuNum; // 主键
@property NSString *name;
@property int age;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<XMGStu *><XMGStu>
RLM_ARRAY_TYPE(XMGStu)
