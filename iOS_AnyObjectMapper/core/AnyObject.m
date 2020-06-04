//
//  AnyObject.m
//  AnyObject
//
//  Created by admin on 2020/5/19.
//  Copyright © 2020 null. All rights reserved.
//

#import "AnyObject.h"

@implementation AnyObject

+ (instancetype)objectWithRawValue:(id)rawValue anyValue:(id)anyValue{
    return [[self alloc] initWithRawValue:rawValue anyValue:anyValue];
}

- (instancetype)initWithRawValue:(id)rawValue anyValue:(id)anyValue{
    if (self = [super init]){
        _rawValue = rawValue;
        _anyValue = anyValue;
    }
    return self;
}

- (NSNumber *)numberValue{
    if([_anyValue isKindOfClass:NSNumber.class]){
        return _anyValue;
    }
    return nil;
}

- (NSString *)stringValue{
    if([_anyValue isKindOfClass:NSString.class]){
        return _anyValue;
    }
    return nil;
}

- (NSArray *)arrayValue{
    if([_anyValue isKindOfClass:NSArray.class]){
        return _anyValue;
    }
    return nil;
}

- (NSDictionary *)dictionaryValue{
    if([_anyValue isKindOfClass:NSDictionary.class]){
        return _anyValue;
    }
    return nil;
}

- (id)get:(Class)cls{
    if ([_anyValue isKindOfClass:cls]){
        return _anyValue;
    }
    return nil;
}

@end
