//
//  two_plistsViewController.m
//  two plists
//
//  Created by sandeep on 12/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "two_plistsViewController.h"

@implementation two_plistsViewController



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
- (void)viewDidLoad {
    [super viewDidLoad];
	NSFileManager *filemanager=[NSFileManager defaultManager];
	NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *docdir=[path objectAtIndex:0];
	NSString *paths=[docdir stringByAppendingPathComponent:@"one.plist"];
	NSString *dbpath=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"one.plist"];
	NSLog(@"Path is %@",paths);
	BOOL success=[filemanager fileExistsAtPath:paths];
	NSError *error;
	NSMutableDictionary *mydic1;
	if(success)
	{
		NSLog(@"file exit in docdir");
		mydic1=[NSMutableDictionary dictionaryWithContentsOfFile:paths];
		return mydic1;

		
	}
	else {
		NSLog(@"file doesn't exit u have to copy from resource");
		
		success=[filemanager copyItemAtPath: dbpath toPath :paths error:&error];
		mydic1=[NSMutableDictionary dictionaryWithContentsOfFile:paths];
		return mydic1;
		if(!success)
			NSLog(@"not able to copy sorry");
		else
			NSLog(@"file exit in docdir");
		
	}
	//NSString *path=[[NSBundle mainBundle]pathForResource:@"one"ofType:@"plist"];
		//NSMutableDictionary *mydic1;
	
	if(mydic1!=nil)
	{
		mydic1=[[NSMutableDictionary alloc]init];
	[mydic1 setObject:@"sandeep" forKey:@"name"];
	[mydic1 setObject:@"05473" forKey:@"rollno"];
	[mydic1 setObject:@"4/12/2012" forKey:@"date"];
		
		//[array addObject:mydic1];
	//[array writeToFile:paths atomically:YES];
	NSLog(@"student details is %@",mydic1);
	}
	//NSMutableArray *array=[NSMutableArray arrayWithContentsOfFile:paths];
	NSMutableDictionary *mydic2=[[NSMutableDictionary alloc]init];
	[mydic2 setObject:@"dilip" forKey:@"name"];
	[mydic2 setObject:@"01407" forKey:@"rollno"];
	[mydic2 setObject:@"4/12/2012" forKey:@"date"];
	//[array writeToFile:paths atomically:YES];
	NSLog(@"student details is %@",mydic2);
	/*NSMutableDictionary *mydic3=[NSMutableDictionary dictionaryWithContentsOfFile:path];
	[mydic3 setObject:@"raju" forKey:@"name"];
	[mydic3 setObject:@"0192" forKey:@"rollno"];
	[mydic3 setObject:@"4/12/2012" forKey:@"date"];
	NSLog(@"student details is %@",mydic3);
	NSMutableDictionary *mydic4=[NSMutableDictionary dictionaryWithContentsOfFile:path];
	[mydic4 setObject:@"suresh" forKey:@"name"];
	[mydic4 setObject:@"05474" forKey:@"rollno"];
	[mydic4 setObject:@"4/12/2012" forKey:@"date"];
	NSLog(@"student details is %@",mydic4);
	NSMutableDictionary *mydic5=[NSMutableDictionary dictionaryWithContentsOfFile:path];
	[mydic5 setObject:@"kiran" forKey:@"name"];
	[mydic5 setObject:@"05461" forKey:@"rollno"];
	[mydic5 setObject:@"4/12/2012" forKey:@"date"];
	NSLog(@"student details is %@",mydic5);
	NSMutableDictionary *mydic6=[NSMutableDictionary dictionaryWithContentsOfFile:path];
	[mydic6 setObject:@"harish" forKey:@"name"];
	[mydic6 setObject:@"05460" forKey:@"rollno"];
	[mydic6 setObject:@"4/12/2012" forKey:@"date"];
	NSLog(@"student details is %@",mydic6);
	NSMutableDictionary *mydic7=[NSMutableDictionary dictionaryWithContentsOfFile:path];
	[mydic7 setObject:@"prashanth" forKey:@"name"];
	[mydic7 setObject:@"05483" forKey:@"rollno"];
	[mydic7 setObject:@"4/12/2012" forKey:@"date"];
	NSLog(@"student details is %@",mydic7);
	NSMutableDictionary *mydic8=[NSMutableDictionary dictionaryWithContentsOfFile:path];
	[mydic8 setObject:@"deevender" forKey:@"name"];
	[mydic8 setObject:@"05463" forKey:@"rollno"];
	[mydic8 setObject:@"4/12/2012" forKey:@"date"];
	NSLog(@"student details is %@",mydic8);
	NSMutableDictionary *mydic9=[NSMutableDictionary dictionaryWithContentsOfFile:path];
	[mydic9 setObject:@"ramu" forKey:@"name"];
	[mydic9 setObject:@"05465" forKey:@"rollno"];
	[mydic9 setObject:@"4/12/2012" forKey:@"date"];
	NSLog(@"student details is %@",mydic9);
}*/
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
