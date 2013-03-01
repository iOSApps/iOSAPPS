//
//  class1.h
//  text2speech2
//
//  Created by Snow Leopard User on 03/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "class1.h"
#import <AVFoundation/AVFoundation.h>

@interface class1 : UIViewController {
	
	IBOutlet UIButton *playButton;
	IBOutlet UIButton *stopButton;
	AVAudioPlayer *audioPlayer;
	NSString *str2;
}

@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (nonatomic,retain) NSString *str2;

-(IBAction)play;
-(IBAction)stop;
-(IBAction)pause;



@end

