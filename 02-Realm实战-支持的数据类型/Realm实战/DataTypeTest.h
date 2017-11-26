//
//  DataTypeTest.h
//  Realm实战
//
//  Created by 王顺子 on 17/2/8.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
#import "Watch.h"

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

// realm中没UIImage这种数据类型，只能重写get方法读取，通过data来存
@property (readonly) UIImage *image;
@property RLMArray<Watch *><Watch>* watchArray;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<DataTypeTest *><DataTypeTest>
RLM_ARRAY_TYPE(DataTypeTest)

