//
//  ViewController.m
//  iOS_AnyObjectMapper
//
//  Created by admin on 2020/5/29.
//  Copyright © 2020 null. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ObjectMapper.h"
#import "System.h"
#import "PublicModel.h"
#import "Computer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ObjectSerializer *serializer = [ObjectSerializer serializer];
    serializer.decodeCodingkeys = @{@"desc": @"desciption", @"ID": @"id"};
    serializer.decodeClassInArrayKeys = @{@"systems": System.class};
    
    NSDictionary *json = [self toJSONWithName:@"computer"];
    NSArray *jsonArray = [self toJSONWithName:@"computers"];
    
    Computer *computer = [Computer decodeWithSource:json serializer:serializer];
    NSArray<Computer *> *computers = [Computer decodeWithSource:jsonArray serializer:serializer];
    
    PublicModel *publicModel = [PublicModel decodeWithSource:json serializer:serializer];
    NSArray<PublicModel *> *publicModels = [PublicModel decodeWithSource:jsonArray serializer:serializer];
}

- (id)toJSONWithName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
}

@end
