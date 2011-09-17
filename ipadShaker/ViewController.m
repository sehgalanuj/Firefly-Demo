//blah-blah

//
//  ViewController.m
//  ipadShaker
//
//  Created by Orsolya Juhasz on 9/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "GlobalData.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    ledStates = [[NSMutableArray alloc] initWithObjects:false, false, false, false, false, nil];
    delayTimes = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:2.0], 2.0, 2.0, 2.0, 2.0, nil];
    
    leds = [[NSMutableArray alloc] initWithObjects:led0, led1, led2, led3, led4, nil];
    
    idealDelay = 3;
    
    numberOfLeds = 5;
    
    NSTimer *timer0 = [NSTimer scheduledTimerWithTimeInterval:[delayTimes objectAtIndex:0] target:self selector:@selector(activateLed:) userInfo:0 repeats:NO];
    NSTimer *timer1 = [NSTimer scheduledTimerWithTimeInterval:[delayTimes objectAtIndex:1] target:self selector:@selector(activateLed:) userInfo:1 repeats:NO];
    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:[delayTimes objectAtIndex:2] target:self selector:@selector(activateLed:) userInfo:2 repeats:NO];
    NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:[delayTimes objectAtIndex:3] target:self selector:@selector(activateLed:) userInfo:3 repeats:NO];
    NSTimer *timer4 = [NSTimer scheduledTimerWithTimeInterval:[delayTimes objectAtIndex:4] target:self selector:@selector(activateLed:) userInfo:4 repeats:NO];
    */
    
    NSNumber *val0 = [NSNumber numberWithInt:0];
    NSNumber *val1 = [NSNumber numberWithInt:1];
    NSNumber *val2 = [NSNumber numberWithInt:2];
    NSNumber *val3 = [NSNumber numberWithInt:3];    
    NSNumber *val4 = [NSNumber numberWithInt:4];
    
    [GlobalData sharedGlobalData].timer0 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)[[GlobalData sharedGlobalData].time0 intValue] target:self selector:@selector(activateLed:) userInfo:val0 repeats:NO];
    [GlobalData sharedGlobalData].timer1 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)[[GlobalData sharedGlobalData].time1 intValue] target:self selector:@selector(activateLed:) userInfo:val1 repeats:NO];
    [GlobalData sharedGlobalData].timer2 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)[[GlobalData sharedGlobalData].time2 intValue] target:self selector:@selector(activateLed:) userInfo:val2 repeats:NO];
    [GlobalData sharedGlobalData].timer3 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)[[GlobalData sharedGlobalData].time3 intValue] target:self selector:@selector(activateLed:) userInfo:val3 repeats:NO];
    [GlobalData sharedGlobalData].timer4 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)[[GlobalData sharedGlobalData].time4 intValue] target:self selector:@selector(activateLed:) userInfo:val4 repeats:NO];
    NSLog(@"On Timer Created");
}

- (void) activateLed: (NSNumber *)led
{
    NSLog(@"LED Activating %@", [led userInfo]);
    	
    UIImage *image = [UIImage imageNamed:@"led_on"];
    
    NSNumber *val0 = [NSNumber numberWithInt:0];
    NSNumber *val1 = [NSNumber numberWithInt:1];
    NSNumber *val2 = [NSNumber numberWithInt:2];
    NSNumber *val3 = [NSNumber numberWithInt:3];    
    NSNumber *val4 = [NSNumber numberWithInt:4];
    
    if([[led userInfo] intValue] == 0) {
        [led0 setImage:image];
        [[GlobalData sharedGlobalData].timer0 invalidate];
        NSLog(@"LED 1 Count %@", [GlobalData sharedGlobalData].count);
        [GlobalData sharedGlobalData].count = [NSNumber numberWithInt:([[GlobalData sharedGlobalData].count intValue] + 1)];
        [GlobalData sharedGlobalData].timer0 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)0.5 target:self selector:@selector(disableLed:) userInfo:val0 repeats:NO];
    }
    else if([[led userInfo] intValue] == 1) {
        [led1 setImage:image];
        [[GlobalData sharedGlobalData].timer1 invalidate];
        [GlobalData sharedGlobalData].timer1 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)0.5 target:self selector:@selector(disableLed:) userInfo:val1 repeats:NO];
    }
    else if([[led userInfo] intValue] == 2) {
        [led2 setImage:image];
        [[GlobalData sharedGlobalData].timer2 invalidate];
        [GlobalData sharedGlobalData].timer2 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)0.5 target:self selector:@selector(disableLed:) userInfo:val2 repeats:NO];
    }
    else if([[led userInfo] intValue] == 3) {
        [led3 setImage:image];
        [[GlobalData sharedGlobalData].timer3 invalidate];
        [GlobalData sharedGlobalData].timer3 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)0.5 target:self selector:@selector(disableLed:) userInfo:val3 repeats:NO];
    }
    else if([[led userInfo] intValue] == 4) {
        [led4 setImage:image];
        [[GlobalData sharedGlobalData].timer4 invalidate];
        [GlobalData sharedGlobalData].timer4 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)0.5 target:self selector:@selector(disableLed:) userInfo:val4 repeats:NO];
    }        
}

- (void) disableLed: (NSNumber *)led
{
    NSLog(@"LED Deactivating %@", [led userInfo]);
    
    UIImage *image = [UIImage imageNamed:@"led_off"];

    NSNumber *val0 = [NSNumber numberWithInt:0];
    NSNumber *val1 = [NSNumber numberWithInt:1];
    NSNumber *val2 = [NSNumber numberWithInt:2];
    NSNumber *val3 = [NSNumber numberWithInt:3];    
    NSNumber *val4 = [NSNumber numberWithInt:4];
    
    if([[GlobalData sharedGlobalData].count intValue] >= 10) {
        [[GlobalData sharedGlobalData].timer0 invalidate];
        [[GlobalData sharedGlobalData].timer1 invalidate];
        [[GlobalData sharedGlobalData].timer2 invalidate];
        [[GlobalData sharedGlobalData].timer3 invalidate];
        [[GlobalData sharedGlobalData].timer4 invalidate];

        [led0 setImage:image];
        [led1 setImage:image];
        [led2 setImage:image];
        [led3 setImage:image];
        [led4 setImage:image];
        
        [GlobalData sharedGlobalData].timer0 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val0 repeats:NO];
        [GlobalData sharedGlobalData].timer1 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val1 repeats:NO];
        [GlobalData sharedGlobalData].timer2 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val2 repeats:NO];
        [GlobalData sharedGlobalData].timer3 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val3 repeats:NO];
        [GlobalData sharedGlobalData].timer4 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val4 repeats:NO];
        
    } else {
        if([[led userInfo] intValue] == 0) {
            [led0 setImage:image];
            [[GlobalData sharedGlobalData].timer0 invalidate];
            [GlobalData sharedGlobalData].timer0 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val0 repeats:NO];
        }
        else if([[led userInfo] intValue] == 1) {
            [led1 setImage:image];
            [[GlobalData sharedGlobalData].timer1 invalidate];
            [GlobalData sharedGlobalData].timer1 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val1 repeats:NO];
        }
        else if([[led userInfo] intValue] == 2) {
            [led2 setImage:image];
            [[GlobalData sharedGlobalData].timer2 invalidate];
            [GlobalData sharedGlobalData].timer2 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val2 repeats:NO];
        }
        else if([[led userInfo] intValue] == 3) {
            [led3 setImage:image];
            [[GlobalData sharedGlobalData].timer3 invalidate];
            [GlobalData sharedGlobalData].timer3 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val3 repeats:NO];
        }
        else if([[led userInfo] intValue] == 4) {
            [led4 setImage:image];
            [[GlobalData sharedGlobalData].timer4 invalidate];
            [GlobalData sharedGlobalData].timer4 = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:@selector(activateLed:) userInfo:val4 repeats:NO];
        }   
    }        
}


/*
 - (void) rescheduleTimer: (NSTimer *)timer
{
    int ledNumber = [[timer userInfo] intValue];
    
    UIImageView *image = [leds objectAtIndex:ledNumber];
    image.image = [UIImage imageNamed:@"led_on"];
    
    NSNumber interval = [delayTimes objectAtIndex:ledNumber];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:[delayTimes objectAtIndex:ledNumber] target:self selector:@selector(activateLed:) userInfo:ledNumber repeats:NO];
}
*/

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight))
        return YES;
    else
        return NO;
}

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type == UIEventSubtypeMotionShake)
    {
        NSLog(@"You just shook the iPad");
        
            NSURL *url = [NSURL URLWithString:@"http://www.anujsehgal.com/cgi-bin/shake.cgi"];
            	
            ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
            [request setValidatesSecureCertificate:NO];
            [request startSynchronous];
            NSError *error = [request error];
            
            if (!error) 
            {
                NSLog(@"No error");
                
                NSString *result = [request responseString];
                
                NSLog(@"%@", result);
                
                if ([result hasPrefix:@"ok"])
                {
                    NSLog(@"DO THE STUFF HERE!!!");
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mote reset" message:@"You just triggered a mote reset!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                    [alert show];
                    [alert release];
                    
                    /*
                    //  reset the visual LEDs
                    idealDelay = rand() % 3;
                    
                    for (int i = 0; i<numberOfLeds; i++)
                    {
                        ledStates[i] = false;
                        delayTimes[i] = rand() % 5;
                    }
                     */
                    
                    
                }
            }
        else
        {
            NSLog(@"Some error");
        }
    }
}

@end
