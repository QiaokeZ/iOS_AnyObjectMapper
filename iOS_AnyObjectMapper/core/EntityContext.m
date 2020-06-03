//
//  EntityContext.m
//  AnyObject
//
//  Created by admin on 2020/5/19.
//  Copyright © 2020 null. All rights reserved.
//

#import "EntityContext.h"

@implementation EntityContext

+ (instancetype)contextWithClass:(Class)cls{
    static CFMutableDictionaryRef classCache;
    static dispatch_semaphore_t semaphore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        semaphore = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    EntityContext *context = CFDictionaryGetValue(classCache, (__bridge const void *)(cls));
    dispatch_semaphore_signal(semaphore);
    if (!context) {
        context = [[self alloc]initWithClass:cls];
        if (context) {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            CFDictionarySetValue(classCache, (__bridge const void *)(cls), (__bridge const void *)(context));
            dispatch_semaphore_signal(semaphore);
        }
    }
    return context;
}

- (instancetype)initWithClass:(Class)cls{
    if (self = [super init]){
        _cls = cls;
        _propertys = [NSArray array];
        NSMutableArray *array = [NSMutableArray array];
        while (cls != [NSObject class]) {
            unsigned int count = 0;
            objc_property_t *list = class_copyPropertyList(cls, &count);
            for (int i = 0; i < count; i++) {
                objc_property_t property = list[i];
                PropertyContext *context = [PropertyContext contextWithProperty:property];
                [array addObject:context];
            }
            free(list);
            cls = class_getSuperclass(cls);
        }
        _propertys = array.copy;
    }
    return self;
}
@end
