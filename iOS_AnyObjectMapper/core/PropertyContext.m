//
//  PropertyContext.m
//  AnyObject
//
//  Created by admin on 2020/5/19.
//  Copyright © 2020 null. All rights reserved.
//

#import "PropertyContext.h"
#import "AnyObject.h"

@implementation PropertyContext

+ (instancetype)contextWithProperty:(objc_property_t)property{
    return [[self alloc]initWithProperty:property];
}

- (instancetype)initWithProperty:(objc_property_t)property{
    if(self = [super init]){
        _property = property;
        _type = [self encodingTypeForAttributeValue:property_copyAttributeValue(property, "T")];
        _name = [NSString stringWithUTF8String:property_getName(property)];
        _getter = NSSelectorFromString(_name);
        _setter = NSSelectorFromString([NSString stringWithFormat:@"set%@%@:",
                                        [_name substringToIndex:1].uppercaseString,
                                        [_name substringFromIndex:1]]);
    }
    return self;
}

- (EncodingType)encodingTypeForAttributeValue:(const char *)value{
    if (value[0] == '@'){
        NSString *className = [[NSString stringWithUTF8String:value] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];
        _cls = NSClassFromString(className);
        if([_cls isSubclassOfClass:NSNumber.class]) return EncodingTypeNSNumber;
        if([_cls isSubclassOfClass:NSString.class]) return EncodingTypeNSString;
        if([_cls isSubclassOfClass:NSArray.class]) return EncodingTypeNSArray;
        if([_cls isSubclassOfClass:NSDictionary.class]) return EncodingTypeNSDictionary;
        if([_cls isSubclassOfClass:AnyObject.class]) return EncodingTypeAnyObject;
        if([NSBundle bundleForClass:_cls] == [NSBundle mainBundle]) return EncodingTypeCustomObject;
    }
    return EncodingTypeNSUnknown;
}

@end
