//
//  DataTypeTest.h
//  Realm实战
//
//  Created by 王顺子 on 17/2/8.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>


@interface DataTypeTest : RLMObject

//BOOL, bool, int, NSInteger, long, long long, float, double, NSString, NSDate, NSData, and NSNumber

@property BOOL B1;
@property bool b2;
@property int i;
@property NSInteger ite;
@property long l;
@property long long ll;
@property float f;
@property double d;
@property NSString *str;
@property NSDate *date;
@property NSData *data;
@property NSNumber<RLMFloat> *num;
//@property NSArray<NSString *>*strs;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<DataTypeTest *><DataTypeTest>
RLM_ARRAY_TYPE(DataTypeTest)

