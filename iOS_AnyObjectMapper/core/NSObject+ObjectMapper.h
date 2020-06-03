//
//  NSObject+ObjectMapper.h
//  AnyObject
//
//  Created by admin on 2020/5/20.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectSerializer.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ObjectMapper)

+ (nullable id)decodeWithSource:(id)source;
+ (nullable id)decodeWithSource:(id)source serializer:(nullable ObjectSerializer *)serializer;

- (nullable id)decodeWithSource:(id)source;
- (nullable id)decodeWithSource:(id)source serializer:(nullable ObjectSerializer *)serializer;

@end

NS_ASSUME_NONNULL_END
