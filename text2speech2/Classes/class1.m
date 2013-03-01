//
//  class1.m
//  text2speech2
//
//  Created by Snow Leopard User on 03/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "class1.h"


@implementation class1
@synthesize playButton,stopButton,audioPlayer,str2;



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *str=[[NSString alloc]initWithFormat:@"http://translate.google.com/translate_tts?tl=en&q=%@",str2];
	NSURL *jsonURL=[NSURL URLWithString:str];
	//http://translate.google.com/translate_tts?tl=en&q=hello%20how%20are%20you”	
	NSLog(@"%@",jsonURL);
	
	// Convert the file path to a URL.
	// NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
	
	//Initialize the AVAudioPlayer.
	NSData *data=[NSData dataWithContentsOfURL:jsonURL];
	self.audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
	
	// Preloads the buffer and prepares the audio for playing.
	[self.audioPlayer prepareToPlay];
	
	//[filePath release];
	//[fileURL release];
	
}
-(IBAction)play {
	
	// Make sure the audio is at the start of the stream.
	// self.audioPlayer.currentTime = 0;
	
	[self.audioPlayer play];
	
}

-(IBAction)pause
{
	[self.audioPlayer pause];
}

-(IBAction)stop {
	
	[self.audioPlayer stop];
	
}





/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
