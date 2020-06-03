//
//  HardDisk.h
//  AnyObject
//
//  Created by admin on 2020/5/20.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HardDisk : NSObject
@property NSString *name;           //名称
@property NSString *series;         //系列
@property NSString *model;          //型号
@property NSString *size;           //大小
@property NSNumber *price;          //价格
@end

NS_ASSUME_NONNULL_END
