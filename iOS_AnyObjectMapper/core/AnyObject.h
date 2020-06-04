//
//  AnyObject.h
//  AnyObject
//
//  Created by admin on 2020/5/19.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnyObject : NSObject

+ (instancetype)objectWithRawValue:(id)rawValue anyValue:(id)anyValue;
- (instancetype)initWithRawValue:(id)rawValue anyValue:(id)anyValue;

@property(readonly, nullable, nonatomic, strong) id rawValue;
@property(readonly, nullable, nonatomic, strong) id anyValue;
@property(readonly, nullable, nonatomic, strong) NSNumber *numberValue;
@property(readonly, nullable, nonatomic, strong) NSString *stringValue;
@property(readonly, nullable, nonatomic, strong) NSArray *arrayValue;
@property(readonly, nullable, nonatomic, strong) NSDictionary *dictionaryValue;

- (id)get:(Class)cls;

@end

NS_ASSUME_NONNULL_END
