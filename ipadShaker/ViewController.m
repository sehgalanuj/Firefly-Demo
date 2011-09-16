//
//  ViewController.m
//  ipadShaker
//
//  Created by Orsolya Juhasz on 9/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"

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
    // Added by Anuj
    
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
}

- (void) activateLed: (NSTimer *)timer
{
    int ledNumber = [[timer userInfo] intValue];
    UIImageView *image = [leds objectAtIndex:ledNumber];
    image.image = [UIImage imageNamed:@"led_on"];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(rescheduleTimer:) userInfo:ledNumber repeats:NO];
}

- (void) rescheduleTimer: (NSTimer *)timer
{
    int ledNumber = [[timer userInfo] intValue];
    
    UIImageView *image = [leds objectAtIndex:ledNumber];
    image.image = [UIImage imageNamed:@"led_on"];
    
    NSNumber interval = [delayTimes objectAtIndex:ledNumber];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:[delayTimes objectAtIndex:ledNumber] target:self selector:@selector(activateLed:) userInfo:ledNumber repeats:NO];
}

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
                    
                    //  reset the visual LEDs
                    idealDelay = rand() % 3;
                    
                    for (int i = 0; i<numberOfLeds; i++)
                    {
                        ledStates[i] = false;
                        delayTimes[i] = rand() % 5;
                    }
                    
                    
                }
            }
        else
        {
            NSLog(@"Some error");
        }
    }
}

@end
