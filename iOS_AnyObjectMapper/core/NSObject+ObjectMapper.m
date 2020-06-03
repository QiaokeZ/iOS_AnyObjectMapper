//
//  NSObject+ObjectMapper.m
//  AnyObject
//
//  Created by admin on 2020/5/20.
//  Copyright © 2020 null. All rights reserved.
//

#import "NSObject+ObjectMapper.h"
#import "EntityContext.h"
#import "AnyObject.h"

@interface _PropertyValue : NSObject
+ (instancetype)valueWithContext:(EntityContext *)context
                      serializer:(ObjectSerializer *)serializer
                        property:(PropertyContext *)property
                             key:(NSString *)key
                           value:(id)value;
- (instancetype)initWithContext:(EntityContext *)context
                     serializer:(ObjectSerializer *)serializer
                       property:(PropertyContext *)property
                            key:(NSString *)key
                          value:(id)value;
@property (readonly, nonatomic, copy) EntityContext *context;
@property (readonly, nonatomic, copy) ObjectSerializer *serializer;
@property (readonly, nonatomic, copy) PropertyContext *property;
@property (readonly, nonatomic, copy) NSString *key;
@property (readonly, nonatomic, copy) id value;
@end

@implementation _PropertyValue
+ (instancetype)valueWithContext:(EntityContext *)context
                      serializer:(ObjectSerializer *)serializer
                        property:(PropertyContext *)property
                             key:(NSString *)key
                           value:(id)value{
    return [[self alloc]initWithContext:context serializer:serializer property:property key:key value:value];
}
- (instancetype)initWithContext:(EntityContext *)context
                     serializer:(ObjectSerializer *)serializer
                       property:(PropertyContext *)property
                            key:(NSString *)key
                          value:(id)value{
    if (self = [super init]){
        _context = context;
        _serializer = serializer;
        _property = property;
        _key = key;
        _value = value;
    }
    return self;
}
@end

@implementation NSObject (ObjectMapper)

+ (id)decodeWithSource:(id)source{
    return [[self alloc] decodeWithSource:source];
}

- (id)decodeWithSource:(id)source{
    return [self decodeWithSource:source serializer:nil];
}

+ (id)decodeWithSource:(id)source serializer:(nullable ObjectSerializer *)serializer{
    return [[self alloc] decodeWithSource:source serializer:serializer];
}

- (id)decodeWithSource:(id)source serializer:(nullable ObjectSerializer *)serializer{
    id json = [self validJSONObject:source];
    if([json isKindOfClass:NSArray.class]){
        EntityContext *context = [EntityContext contextWithClass:self.class];
        return [self decode:context array:json serializer:serializer];
    } else if([json isKindOfClass:NSDictionary.class]){
        EntityContext *context = [EntityContext contextWithClass:self.class];
        return [self decode:context dictionary:json serializer:serializer];
    }
    return nil;
}

- (id)decode:(EntityContext *)context array:(NSArray *)array serializer:(ObjectSerializer *)serializer{
    NSMutableArray *list = [NSMutableArray array];
    for (id object in array) {
        id instance = [context.cls decodeWithSource:object serializer:serializer];
        [list addObject:instance];
    }
    return list.copy;
}

- (id)decode:(EntityContext *)context dictionary:(NSDictionary *)dictionary serializer:(ObjectSerializer *)serializer{
    for (PropertyContext *property in context.propertys) {
        NSString *key = property.name;
        if (serializer != nil){
            if ([serializer.decodeCodingkeys.allKeys containsObject:key]){
                key = [serializer.decodeCodingkeys objectForKey:key];
            }
        }
        id value = [dictionary objectForKey:key];
        if (value != nil){
            _PropertyValue *object = [_PropertyValue valueWithContext:context serializer:serializer property:property key:key value:value];
            [self setPropertyValue:object];
        }
    }
    return self;
}

- (void)setPropertyValue:(_PropertyValue *)object{
    if (object.property.type == EncodingTypeAnyObject){
        if([object.value isKindOfClass:NSDictionary.class] || [object.value isKindOfClass:NSArray.class]){
            AnyObject *any = [AnyObject objectWithRawValue:object.value anyValue:[object.context.cls decodeWithSource:object.value serializer:object.serializer]];
            ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, any);
        }  else {
            AnyObject *any = [AnyObject objectWithRawValue:object.value anyValue:object.value];
            ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, any);
        }
    }else{
        switch (object.property.type) {
            case EncodingTypeNSNumber:
                if ([object.value isKindOfClass:NSNumber.class]){
                    ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, object.value);
                }
                break;
            case EncodingTypeNSString:
                if ([object.value isKindOfClass:NSString.class]){
                    ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, object.value);
                }
                break;
            case EncodingTypeNSDictionary:
                if ([object.value isKindOfClass:NSDictionary.class]){
                    ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, object.value);
                }
                break;
            case EncodingTypeNSArray:
                if ([object.value isKindOfClass:NSArray.class]){
                    Class cls = [object.serializer.decodeClassInArrayKeys objectForKey:object.key];
                    if (cls != nil){
                        id value = [cls decodeWithSource:object.value serializer:object.serializer];
                        ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, value);
                    }else {
                        ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, object.value);
                    }
                }
                break;
            case EncodingTypeCustomObject:
                if ([object.value isKindOfClass:NSDictionary.class]){
                    ((void (*)(id, SEL, id))(void *) objc_msgSend)(self, object.property.setter, [object.property.cls decodeWithSource:object.value serializer:object.serializer]);
                }
                break;
            default:break;
        }
    }
}

- (id)validJSONObject:(id)object{
    NSData *data = nil;
    if([object isKindOfClass:NSArray.class] || [object isKindOfClass:NSDictionary.class]){
        return object;
    }else if ([object isKindOfClass:NSData.class]) {
        data = object;
    }else if ([object isKindOfClass:NSString.class]) {
        data = [(NSString *)object dataUsingEncoding:NSUTF8StringEncoding];
    }
    if(data){
        return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
    }
    return nil;
}

@end
