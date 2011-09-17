//
//  GlobalData.m
//  Firefly Demo
//
//  Created by Anuj Sehgal on 9/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData

@synthesize count;

@synthesize time0;
@synthesize time1;
@synthesize time2;
@synthesize time3;
@synthesize time4;

@synthesize timer0;
@synthesize timer1;
@synthesize timer2;
@synthesize timer3;
@synthesize timer4;

static GlobalData *sharedGlobalData = nil;

+ (GlobalData *)sharedGlobalData {
    if (sharedGlobalData == nil) {
        sharedGlobalData = [[super allocWithZone:NULL] init];

        sharedGlobalData.count = [NSNumber numberWithInt:0];
        
        sharedGlobalData.time0 = [NSNumber numberWithFloat:0.30];
        sharedGlobalData.time1 = [NSNumber numberWithFloat:1];
        sharedGlobalData.time2 = [NSNumber numberWithFloat:2];
        sharedGlobalData.time3 = [NSNumber numberWithFloat:3];
        sharedGlobalData.time4 = [NSNumber numberWithFloat:4];
        
        sharedGlobalData.timer0 = nil;
        sharedGlobalData.timer1 = nil;
        sharedGlobalData.timer2 = nil;
        sharedGlobalData.timer3 = nil;
        sharedGlobalData.timer4 = nil;
    }
    return sharedGlobalData;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedGlobalData == nil) {
            sharedGlobalData = [super allocWithZone:zone];
            return sharedGlobalData;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

- (void)release {
    
}

- (id)autorelease {
    return self;
}

@end
