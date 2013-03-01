//
//  second.m
//  flip
//
//  Created by flab on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "second.h"


@implementation second

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

-(IBAction)save1:(id)sender
{
	//[UIView beginanimations:
	UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"button" message:@"iam pressed the button view" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
	NSFileManager *fm=[NSFileManager defaultManager];
	NSArray *ara=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
												   , NSUserDomainMask, YES);
	NSString *documentfolderpath=[ ara objectAtIndex:0];
	NSString *dbpath=[documentfolderpath stringByAppendingPathComponent:@"sandy.plist"];
	
	int success=[fm fileExistsAtPath:dbpath];
	NSError *error;
	
	if(!success)
	{
		NSString *str=[[NSBundle mainBundle] pathForResource:@"sandy" ofType:@"plist"];
		success=[fm copyItemAtPath:str toPath:dbpath error:&error];
	}
	NSMutableArray *array=[[NSMutableArray alloc]init];
	NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
	/*
	[dic setObject:self.text6.text forKey:@"gender"];
	[dic setObject:self.text1.text forKey:@"username"];
	[dic setObject:self.text2.text forKey:@"password"];
	[dic setObject:self.text3.text forKey:@"r password"];
	[dic setObject:self.text4.text forKey:@"name"];
	[dic setObject:self.text5.text forKey:@"age"];		NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
		NSString *paths=[[path objectAtIndex:0]stringByAppendingPathComponent:@"save.plist"];
				//   BOOL success=[manager fileExistsAtPath:paths];*/
													   //NSMutableArray *array=[NSMutableArray arrayWithContentsOfFile:paths];
													   //NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
													   [dic setObject:t1.text forKey:@"name"];
													   [dic setObject:t2.text forKey:@"password"];
													   [array addObject:dic];
													   [array writeToFile:dbpath atomically:YES];
													   
	
	
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
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
}


- (void)dealloc {
    [super dealloc];
}


@end
