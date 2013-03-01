//
//  ViewController.h
//  Audio Player
//
//  Created by Lion User on 28/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer *player;
}
@property(nonatomic,strong)AVAudioPlayer *player;
-(IBAction) play;
@end
