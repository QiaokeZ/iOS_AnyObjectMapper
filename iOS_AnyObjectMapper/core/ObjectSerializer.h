//
//  ObjectSerializer.h
//  AnyObject
//
//  Created by admin on 2020/5/19.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectSerializer : NSObject

+ (instancetype)serializer;

//@property(nonatomic, copy) NSDictionary<NSString *, NSString *> *encodeCodingkeys;
@property(nonatomic, copy) NSDictionary<NSString *, NSString *> *decodeCodingkeys;
@property(nonatomic, copy) NSDictionary<NSString *, Class> *decodeClassInArrayKeys;

@end

NS_ASSUME_NONNULL_END
