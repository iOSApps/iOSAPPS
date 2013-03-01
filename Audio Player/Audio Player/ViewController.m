//
//  ViewController.m
//  Audio Player
//
//  Created by Lion User on 28/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"song" ofType:@"mp3"]];
    NSError *error;
    player = [[AVAudioPlayer alloc]
				   initWithContentsOfURL:url
				   error:&error];
    if (error)
	{
		NSLog(@"Error in audioPlayer: %@", 
			  [error localizedDescription]);
	} else {
		player.delegate = self;
		[player prepareToPlay];
	}

}
-(IBAction) play
{
    [player play];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
