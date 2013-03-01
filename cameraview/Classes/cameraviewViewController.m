//
//  cameraviewViewController.m
//  cameraview
//
//  Created by sandeep on 31/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "cameraviewViewController.h"

@implementation cameraviewViewController
@synthesize imageView;



- (void) useCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:
		 UIImagePickerControllerSourceTypeCamera])
    {
		UIImagePickerController *imagePicker =
		[[UIImagePickerController alloc] init];
		imagePicker.delegate = self;
		imagePicker.sourceType = 
		UIImagePickerControllerSourceTypeCamera;
		imagePicker.mediaTypes = [NSArray arrayWithObjects:
								  (NSString *) kUTTypeImage,
								  nil];
		imagePicker.allowsEditing = NO;
		[self presentModalViewController:imagePicker 
								animated:YES];
		[imagePicker release];
		newMedia = YES;
	}
}


- (void) useCameraRoll
{
    if ([UIImagePickerController isSourceTypeAvailable:
		 UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
		UIImagePickerController *imagePicker =
		[[UIImagePickerController alloc] init];
		imagePicker.delegate = self;
		imagePicker.sourceType = 
		UIImagePickerControllerSourceTypePhotoLibrary;
		imagePicker.mediaTypes = [NSArray arrayWithObjects:
								  (NSString *) kUTTypeImage,
								  nil];
		imagePicker.allowsEditing = NO;
		[self presentModalViewController:imagePicker animated:YES];
		[imagePicker release];
        newMedia = NO;
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	NSString *mediaType = [info
						   objectForKey:UIImagePickerControllerMediaType];
	[self dismissModalViewControllerAnimated:YES];
	if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info 
						  objectForKey:UIImagePickerControllerOriginalImage];
		
        imageView.image = image;
        if (newMedia)
            UIImageWriteToSavedPhotosAlbum(image, 
										   self,
										   @selector(image:finishedSavingWithError:contextInfo:),
										   nil);
	}
	else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
	{
		// Code here to support video if enabled
	}
}
-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error 
 contextInfo:(void *)contextInfo
{
	if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle: @"Save failed"
							  message: @"Failed to save image"\
							  delegate: nil
							  cancelButtonTitle:@"OK"
							  otherButtonTitles:nil];
        [alert show];
        [alert release];
	}
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissModalViewControllerAnimated:YES];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.imageView = nil;
}


- (void)dealloc {
    [super dealloc];
	[imageView release];

}

@end
