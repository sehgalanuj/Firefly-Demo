//
//  GlobalData.h
//  Firefly Demo
//
//  Created by Anuj Sehgal on 9/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalData : NSObject {
    NSNumber *count;
    
    NSNumber *time0;
    NSNumber *time1;
    NSNumber *time2;
    NSNumber *time3;
    NSNumber *time4;
    
    NSTimer *timer0;
    NSTimer *timer1;
    NSTimer *timer2;
    NSTimer *timer3;
    NSTimer *timer4;
}

@property (nonatomic, retain) NSNumber *count;
@property (nonatomic, retain) NSNumber *time0;
@property (nonatomic, retain) NSNumber *time1;
@property (nonatomic, retain) NSNumber *time2;
@property (nonatomic, retain) NSNumber *time3;
@property (nonatomic, retain) NSNumber *time4;
@property (nonatomic, retain) NSTimer *timer0;
@property (nonatomic, retain) NSTimer *timer1;
@property (nonatomic, retain) NSTimer *timer2;
@property (nonatomic, retain) NSTimer *timer3;
@property (nonatomic, retain) NSTimer *timer4;

+(GlobalData *) sharedGlobalData;

@end
