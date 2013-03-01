//
//  usingPlistViewController.m
//  usingPlist
//
//  Created by Chakra on 13/02/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import "usingPlistViewController.h"
#import "fourLines.h"


@implementation usingPlistViewController

@synthesize text1,text2,text3,text4, textView;


-(NSString *)dataFilePath{


	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"newDocumentData" ofType:@"plist"];
	NSString *fileContent =[ [NSString alloc] initWithContentsOfFile:filePath];
	NSLog(@"file content : %@",fileContent);
	return filePath;

	
}

-(void)handleNotification :(NSNotification *)notify{
	
	NSLog(@"NotificationCatch");
	
	fourLines *fourlines = [[fourLines alloc] init];
	
	fourlines.field1 = text1.text;
	
	fourlines.field2 = text2.text;
	fourlines.field3 = text3.text;
	fourlines.field4 = text4.text;
	fourlines.textViewField = textView.text;
	
	NSMutableData *data = [[NSMutableData alloc] init];
	
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] 
								 initForWritingWithMutableData:data];
	[archiver encodeObject:fourlines forKey:fDataKey];
	[archiver finishEncoding];
	
	[data writeToFile:[self dataFilePath] atomically:YES];
	[fourlines release];
	[archiver release];
	[data release];
	
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIApplication *app = [UIApplication sharedApplication];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"pushNotify" object:app];

	
//	[self.textView setDelegate:self];
	
	NSString * filePath = [self dataFilePath];
	
		
		NSData *data = [[NSMutableData	alloc]initWithContentsOfFile:filePath];
	
	
		
		NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] 
										 initForReadingWithData:data];
		
		fourLines *fourlines = [unarchiver decodeObjectForKey:fDataKey];
		[unarchiver finishDecoding];
	
		text1.text = fourlines.field1;
		text2.text = fourlines.field2;
		text3.text = fourlines.field3;
		text4.text = fourlines.field4;
	textView.text = fourlines.textViewField;
		
		[unarchiver release];
		[data release];

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
	
	[text1 release];
	[text2 release];
	[text3 release];
	[text4 release];
}


- (IBAction) updateText:(id) sender{
	
}

#pragma mark -
#pragma mark UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
	
	NSLog(@"self.view : %@",self.view);
	navController = [[UINavigationController alloc] initWithRootViewController:self];
	navController.navigationBar.frame = CGRectMake(0, 0, 320,40);
	[self.view addSubview:navController.navigationBar];
	
	NSLog(@"editing begin");
	// provide my own Save button to dismiss the keyboard
	UIBarButtonItem* saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																			  target:self action:@selector(saveAction:)];
	self.navigationItem.rightBarButtonItem = saveItem;
	[saveItem release];
}

- (void)saveAction:(id)sender
{
	// finish typing text/dismiss the keyboard by removing it as the first responder
	//
	[self.textView resignFirstResponder];
	self.navigationItem.rightBarButtonItem = nil;	// this will remove the "save" button
	[navController.navigationBar removeFromSuperview];
}


@end
