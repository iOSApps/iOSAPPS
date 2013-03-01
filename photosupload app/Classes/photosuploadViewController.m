//
//  photosuploadViewController.m
//  photosupload
//
//  Created by sandeep on 04/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "photosuploadViewController.h"

@implementation photosuploadViewController
@synthesize al;
@synthesize as;
@synthesize ai;
@synthesize wb;
@synthesize iv;
@synthesize b;




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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[super viewDidLoad];
	
	    wb=[[UIWebView alloc] initWithFrame:CGRectMake(20,20 ,200,300 )];
	    wb.delegate=self;
	    NSURL *myurl=[NSURL URLWithString:@"http://www.google.com/"];
	    NSURLRequest *myrequest=[NSURLRequest requestWithURL:myurl];
	    [wb loadRequest:myrequest];
	    [self.view addSubview:wb];
	
	
	   ai=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	    ai.center=CGPointMake(100,100);
	    [wb addSubview:ai];
	
	
	    al=[[UIAlertView  alloc] initWithTitle:@"message" message:@"webview finished loading" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"help",nil];
	
	
	    b=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	       [b setTitle:@"add photos" forState:UIControlStateNormal];
	       b.frame=CGRectMake(10,420 ,100 ,30 );
	       [b addTarget:self action:@selector(addphoto)forControlEvents:UIControlEventTouchUpInside];
	       [self.view addSubview:b];
	
	
	
	       as=[[UIActionSheet alloc] initWithTitle:@"my action" delegate:self 
				 cancelButtonTitle:@"cancel" destructiveButtonTitle:@"delete" 
				 otherButtonTitles:@"load image from lib",@"load image from camera",nil];
				iv=[[UIImageView alloc] initWithFrame:CGRectMake(150,340 ,100 ,100 )];
	           iv.backgroundColor=[UIColor redColor];
	       [self.view addSubview:iv];
	
	       }   



-(void)webViewDidStartLoad:(UIWebView *)webView
       {
	           [ai startAnimating];
		}
-(void)webViewDidFinishLoad:(UIWebView *)webView
       {
	           [ai stopAnimating];
	           [al show];
	   }
       -(void)webview:(UIWebView *)webview didFailLoadWithError:(NSError *)error
       {
	   }

      -(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex       
			{
	
	          NSLog(@" the clicked button  index %d:",buttonIndex);
	      }
       -(void)addphoto
       {
	           [as showInView:self.view];
	       }
       -(void)actionsheet:(UIActionSheet *)actionsheet 
 clickedButtonAtIndex:(NSInteger)buttonIndex
       {
	           NSLog(@" the clicked button :%d",buttonIndex);
	           if(buttonIndex==1 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
		           {
			               UIImagePickerController *impicker=[UIImagePickerController new];
			               impicker.delegate=self;
			
			 impicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
			               [self presentModalViewController:impicker animated:YES];
			           }
	       }

       -(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editinginfo:(NSDictionary *)editingInfo
       {
	           NSLog(@"enter");
		}
       -(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
       {
	           NSLog(@"enter %@",info);
	          iv.image=[info objectForKey:UIImagePickerControllerOriginalImage];
	           [picker dismissModalViewControllerAnimated:YES];
	
	    }


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
       {
		}





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
}


- (void)dealloc {
    [super dealloc];
}

@end
