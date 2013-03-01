//
//  core.m
//  coredata
//
//  Created by venky on 19/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "core.h"
#import "coredataAppDelegate.h"

@implementation core
@synthesize name, address, phone, status;

- (void) saveData
{
	coredataAppDelegate *appDelegate = 
    [[UIApplication sharedApplication] delegate];
	
	NSManagedObjectContext *context = 
    [appDelegate managedObjectContext];
	NSManagedObject *newContact;
	newContact = [NSEntityDescription
				  insertNewObjectForEntityForName:@"Core"
				  inManagedObjectContext:context];
	[newContact setValue:name.text forKey:@"name"];
	[newContact setValue:address.text forKey:@"addres"];
	[newContact setValue:phone.text forKey:@"phone"];
	name.text = @"";
	address.text = @"";
	phone.text = @"";
	NSError *error;
	[context save:&error];
	status.text =@"saved";
}

- (void) findContact
{
	coredataAppDelegate *appDelegate = 
	[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = 
	[appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = 
	[NSEntityDescription entityForName:@"Core" 
				inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *pred = 
	[NSPredicate predicateWithFormat:@"(name = %@)", 
	 name.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request 
											  error:&error];
    if ([objects count] == 0) {
		status.text = @"No matches";
    } else {
		matches = [objects objectAtIndex:0];
		address.text = [matches valueForKey:@"addres"];
		phone.text = [matches valueForKey:@"phone"];
		status.text = [NSString stringWithFormat:
					   @"%d matches found", [objects count]];
    }
	
	
	
}
- (IBAction) get{
	coredataAppDelegate *appDelegate = 
	[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = 
	[appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = 
	[NSEntityDescription entityForName:@"Core" 
				inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
	NSError *error;
	NSArray *fetchedObjects = [context executeFetchRequest:request error:&error];
	for (NSManagedObject *info in fetchedObjects) {
		NSLog(@"Name: %@", [info valueForKey:@"name"]);
		//NSManagedObject *details = [info valueForKey:@"addres"];
		NSLog(@"Zip: %@", [info valueForKey:@"phone"]);
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
