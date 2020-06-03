//
//  PublicModel.h
//  AnyObject
//
//  Created by admin on 2020/5/21.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnyObject.h"

NS_ASSUME_NONNULL_BEGIN

/// 将服务器有可能返回的字段全部写在里面
/// 不确定的类型使用AnyObject
/// 确定的类型目前只支持这5种: NSNumber,NSString,NSArray,NSDictionary,自定义类型
@interface PublicModel : NSObject
@property NSNumber *price;
@property NSString *version;
@property AnyObject *name;
@property AnyObject *ID;
@property AnyObject *desc;
@property AnyObject *cpu;
@property AnyObject *memory;
@property AnyObject *graphics;
@property AnyObject *mainboard;
@property AnyObject *radiator;
@property AnyObject *hardDisk;
@property AnyObject *networkAdapter;
@property AnyObject *monitor;
@property AnyObject *keyboard;
@property AnyObject *mouse;
@property AnyObject *systems;
@property AnyObject *codeName;
@property AnyObject *package;
@property AnyObject *technology;
@property AnyObject *coreVID;
@property AnyObject *coreSpeed;
@property AnyObject *multiplier;
@property AnyObject *busSpeed;
@property AnyObject *ratedFSB;
@property AnyObject *cores;
@property AnyObject *threads;
@property AnyObject *type;
@property AnyObject *size;
@property AnyObject *dramFrequency;
@property AnyObject *gpu;
@property AnyObject *coolingMode;
@property AnyObject *series;
@property AnyObject *model;
@property AnyObject *interface;
@property AnyObject *resolution;
@end

NS_ASSUME_NONNULL_END
