//
//  Computer.h
//  AnyObject
//
//  Created by admin on 2020/5/20.
//  Copyright © 2020 null. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "System.h"
#import "CPU.h"
#import "Memory.h"
#import "Graphics.h"
#import "Mainboard.h"
#import "Radiator.h"
#import "Monitor.h"
#import "Keyboard.h"
#import "HardDisk.h"
#import "NetworkAdapter.h"
#import "Mouse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Computer : NSObject
@property NSString *name;
@property NSString *ID;
@property NSString *desc;
@property CPU *cpu;
@property Memory *memory;
@property Graphics *graphics;
@property Mainboard *mainboard;
@property Radiator *radiator;
@property HardDisk *hardDisk;
@property NetworkAdapter *networkAdapter;
@property Monitor *monitor;
@property Keyboard *keyboard;
@property Mouse *mouse;
@property NSArray<System *> *systems;

//@property NSNumber *number;
//@property NSArray *array;
//@property NSString *string;
//@property NSDictionary *dictionary;
//@property Mouse *mouse;

@end

NS_ASSUME_NONNULL_END
