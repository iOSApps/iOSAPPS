//
//  cameraviewViewController.h
//  cameraview
//
//  Created by sandeep on 31/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface cameraviewViewController : UIViewController<UIImagePickerControllerDelegate, 
UINavigationControllerDelegate>
{
	UIImageView *imageView;
	BOOL newMedia;
}
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
- (IBAction)useCamera;
- (IBAction)useCameraRoll;




@end

