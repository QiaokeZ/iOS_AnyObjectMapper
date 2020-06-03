//
//  PropertyContext.h
//  AnyObject
//
//  Created by admin on 2020/5/19.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

typedef NS_ENUM (NSUInteger, EncodingType) {
    EncodingTypeNSUnknown = 0,
    EncodingTypeNSNumber,
    EncodingTypeNSString,
    EncodingTypeNSArray,
    EncodingTypeNSDictionary,
    EncodingTypeAnyObject,
    EncodingTypeCustomObject
};

NS_ASSUME_NONNULL_BEGIN

@interface PropertyContext : NSObject

+ (nullable instancetype)contextWithProperty:(objc_property_t)property;
- (instancetype)initWithProperty:(objc_property_t)property;

@property (readonly, nonatomic, assign) objc_property_t property;
@property (readonly, nonatomic, strong) NSString *name;
@property (readonly, nonatomic, assign) EncodingType type;
@property (readonly, nonatomic, assign) Class cls;
@property (readonly ,nonatomic, assign) SEL setter;
@property (readonly, nonatomic, assign) SEL getter;

@end

NS_ASSUME_NONNULL_END
