//
//  plistViewController.m
//  plist
//
//  Created by naveen on 29/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "plistViewController.h"

@implementation plistViewController
@synthesize text1;
@synthesize text2;
@synthesize text3;
@synthesize text4;

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

-(IBAction)ADD
{
	NSFileManager *fileManager=[NSFileManager defaultManager];
	NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *docdir=[path objectAtIndex:0];
	NSString *paths=[docdir stringByAppendingPathComponent:@"myplist.plist"];
	BOOL success=[fileManager fileExistsAtPath:paths];
	NSError *error;
	if(success)
	{
		NSLog(@"file exist at doc dir");
	}
	else
	{
		NSLog(@"file doesnt exist u have to copy from resource");
		NSString *dbpath=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"myplist.plist"];
		success=[fileManager copyItemAtPath:dbpath toPath:paths error:&error];
		if(!success)
			NSLog(@"not able to copy");
			else 
				NSLog(@"file exist in docdir");
	}
	
	NSMutableArray *myarray=[NSMutableArray arrayWithContentsOfFile:paths];
	//NSLog(@"%@",myarray);
	NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
	[mydict setObject:text1.text forKey:@"name"];
	[mydict setObject:text2.text forKey:@"usn"];
	[mydict setObject:text3.text forKey:@"dept"];
	[mydict setObject:text4.text forKey:@"place"];
	[myarray addObject:mydict];
	
	[myarray writeToFile:paths atomically:YES];
	NSLog(@"%@",myarray);
}



-(IBAction)clear
{
	text1.text=NULL;
	text2.text=NULL;
	text3.text=NULL;
	text4.text=NULL;
}
	
-(IBAction)search
{
	NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *docdir=[path objectAtIndex:0];
	NSString *paths=[docdir stringByAppendingPathComponent:@"myplist.plist"];
	NSMutableArray *myarray=[NSMutableArray arrayWithContentsOfFile:paths];
	NSMutableDictionary *mydict=[NSMutableDictionary new];
	static int c;
	c=[myarray count];
	
	NSLog(@"count %d",c);
	//r=[text1.text intValue];
	//NSLog(@"%d",r);
	
	for(int i=0;i<c;i++)
	{
		mydict=[myarray objectAtIndex:i];
		//temp=[[mydict objectForKey:@"name"]intValue];
		//NSLog(@"%d",temp);
		
		
		if([text2.text isEqualToString:[mydict  objectForKey:@"usn"]])
		{
			self.text1.text =[mydict objectForKey:@"name"];
			self.text2.text=[mydict objectForKey:@"usn"];
			self.text3.text=[mydict objectForKey:@"dept"];
			self.text4.text=[mydict objectForKey:@"place"];
			//NSLog(@"%@",myarray);
		
		}
	}
}
	
	

	




//-(IBAction)search
//{
	//NSString

	
	


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
}


- (void)dealloc {
    [super dealloc];
}

@end
