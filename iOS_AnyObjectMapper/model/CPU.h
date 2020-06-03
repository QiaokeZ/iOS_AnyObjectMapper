//
//  CPU.h
//  AnyObject
//
//  Created by admin on 2020/5/20.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPU : NSObject
@property NSString *name;       //名称
@property NSString *codeName;   //代号
@property NSString *package;    //插槽
@property NSString *technology; //工艺
@property NSString *coreVID;    //核心电压
@property NSString *coreSpeed;  //核心速度
@property NSString *multiplier; //倍频
@property NSString *busSpeed;   //总线速度
@property NSString *ratedFSB;   //ratedFSB
@property NSNumber *cores;      //核心数
@property NSNumber *threads;    //线程数
@property NSNumber *price;      //价格
@end

NS_ASSUME_NONNULL_END
