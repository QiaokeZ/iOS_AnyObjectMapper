//
//  EntityContext.h
//  AnyObject
//
//  Created by admin on 2020/5/19.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PropertyContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntityContext : NSObject

+ (nullable instancetype)contextWithClass:(Class)cls;
- (nullable instancetype)initWithClass:(Class)cls;

@property(readonly, nonatomic, strong) Class cls;
@property(readonly, nonatomic, strong) NSArray<PropertyContext *> * propertys;

@end

NS_ASSUME_NONNULL_END
