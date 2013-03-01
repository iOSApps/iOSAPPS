//
//  first.m
//  imageinplist
//
//  Created by sandeep on 05/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "first.h"


@implementation first
@synthesize name;
@synthesize rollno;
@synthesize dob;
@synthesize b,l;
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}


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
	name=[[UITextField alloc]initWithFrame:CGRectMake(100,20, 150, 50)];
	name.backgroundColor=[UIColor whiteColor];
	name.delegate=self;
	name.placeholder=@"name";
	[self.view addSubview:name];
	
	rollno=[[UITextField alloc]initWithFrame:CGRectMake(100,80, 150, 50)];
	rollno.backgroundColor=[UIColor whiteColor];
	rollno.delegate=self;
	rollno.placeholder=@"rollno";
	[self.view addSubview:rollno];
	
	dob=[[UITextField alloc]initWithFrame:CGRectMake(100,160, 150, 50)];
	dob.backgroundColor=[UIColor whiteColor];
dob.delegate=self;
	dob.placeholder=@"dob";
	[self.view addSubview:dob];
	
	l=[[UILabel alloc]initWithFrame:CGRectMake(20,150 , 200, 100)];
	   l.backgroundColor=[UIColor redColor];
	   l.text=@"secondview";
	   [self.view addSubview:l];
	
	
	b=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[b setTitle:@"adding" forState:UIControlStateNormal];
	b.frame=CGRectMake(10,420, 100,30 );
	[b addTarget:self action:@selector(show3) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b];
	
	
}
-(void)show3
{
	NSFileManager *filemanager=[NSFileManager defaultManager];
	NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *docdir=[path objectAtIndex:0];
	NSString *paths=[docdir stringByAppendingPathComponent:@"t1.plist"];
	NSLog(@"Path is %@",paths);
	BOOL success=[filemanager fileExistsAtPath:paths];
	NSError *error;
	if(!success)
	
	{
		NSLog(@"file doesn't exit u have to copy from resource");
		NSString *dbpath=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"t1.plist"];
		success=[filemanager copyItemAtPath: dbpath toPath :paths error:&error];
		
		
	}
	NSMutableArray *array=[NSMutableArray arrayWithContentsOfFile:paths];
	NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
	[dic setObject:name.text forKey:@"name"];
	[dic setObject:rollno.text forKey:@"rollno"];
	[dic setObject:dob.text forKey:@"dob"];
	[array addObject:dic];
	[array writeToFile:paths atomically:YES];
	NSLog(@"%@",array);
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
  
		
}
 

	

- (void)dealloc {
    [super dealloc];
}


@end
