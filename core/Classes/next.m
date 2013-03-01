//
//  next.m
//  manojcore
//
//  Created by manoj1 on 20/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "next.h"
#import"manojcoreAppDelegate.h"

@implementation next
@synthesize salary,emp_id,emp_name,status;
- (void) saveData
{
	manojcoreAppDelegate *appDelegate = 
    [[UIApplication sharedApplication] delegate];
	
	NSManagedObjectContext *context = 
    [appDelegate managedObjectContext];
	NSManagedObject *newContact;
	newContact = [NSEntityDescription
				  insertNewObjectForEntityForName:@"employee"
				  inManagedObjectContext:context];
	[newContact setValue:emp_name.text forKey:@"emp_name"];
	[newContact setValue:emp_id.text forKey:@"emp_id"];
	[newContact setValue:salary.text forKey:@"salary"];
	emp_name.text = @"";
	emp_id.text = @"";
	salary.text = @"";
	NSError *error;
	[context save:&error];
	status.text =@"saved";
}

- (void) findContact
{
	manojcoreAppDelegate *appDelegate = 
	[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = 
	[appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = 
	[NSEntityDescription entityForName:@"employee" 
				inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *pred = 
	[NSPredicate predicateWithFormat:@"(emp_name = %@)", 
	emp_name.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request 
											  error:&error];
    if ([objects count] == 0) {
		status.text = @"No matches";
    } else {
		matches = [objects objectAtIndex:0];
		emp_id.text = [matches valueForKey:@"emp_id"];
		salary.text = [matches valueForKey:@"salary"];
		status.text = [NSString stringWithFormat:
					   @"%d matches found", [objects count]];
    }
	
	
	
}
- (IBAction) get{
	manojcoreAppDelegate *appDelegate = 
	[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = 
	[appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = 
	[NSEntityDescription entityForName:@"employee" 
				inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
	NSError *error;
	NSArray *fetchedObjects = [context executeFetchRequest:request error:&error];
	for (NSManagedObject *info in fetchedObjects) {
		NSLog(@"Name: %@", [info valueForKey:@"emp_name"]);
		//NSManagedObject *details = [info valueForKey:@"addres"];
		NSLog(@"salary: %@", [info valueForKey:@"salary"]);
		NSLog(@"emp_id: %@", [info valueForKey:@"emp_id"]);

	}
	
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

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
