//
//  ViewController.h
//  ipadShaker
//
//  Created by Orsolya Juhasz on 9/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *led0;
    IBOutlet UIImageView *led1;
    IBOutlet UIImageView *led2;
    IBOutlet UIImageView *led3;
    IBOutlet UIImageView *led4;
    
    NSMutableArray *ledStates;
    NSMutableArray *delayTimes;
    NSMutableArray *leds;
    NSNumber *idealDelay;
    
    int numberOfLeds;
}

@end
