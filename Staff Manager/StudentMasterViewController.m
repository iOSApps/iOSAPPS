//
//  StudentMasterViewController.m
//  StudentManager
//
//  Created by Udaya V Nayak on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Student.h"
#import "StudentMasterViewController.h"

@implementation StudentMasterViewController

@synthesize managedObjectContext;
@synthesize _studentList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:38/256.0 green:117/256.0 blue:97/256.0 alpha:1.0]];    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Student" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    self._studentList = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    self.title = @"Student";
       
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_studentList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
       
   
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                 initWithStyle: UITableViewCellStyleSubtitle
                 reuseIdentifier: CellIdentifier];
              
    }
    /*UILongPressGestureRecognizer *pressRecongnizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tableCellPressed:)];
    pressRecongnizer.minimumPressDuration = 0.5f;
    [self.cell deleteGestureRecognizer:pressRecongnizer]; */
    
       
    
    
    
    // Set up the cell...
    Student *info = [_studentList objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                           info.student_fname, info.student_lname];
    cell.detailTextLabel.text = info.student_email;
   
    
    
    return cell;    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    }
   // Navigation logic may go here. Create and push another view controller.



- (void)theSaveButtonOnTheAddStudentTVCWasTapped:(AddStudentTVC *)controller
{
         
    [controller.navigationController popViewControllerAnimated:YES];    
    // do something here like refreshing the table or whatever
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Student" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    self._studentList = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    [self.tableView reloadData];
    // close the delegated view
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"segue_AddStudent"])
	{
        //Changing the bar button title
        AddStudentTVC *addStudentTVC = segue.destinationViewController;
        addStudentTVC.managedObjectContext = self.managedObjectContext;
        addStudentTVC.delegate = self;
        
        UIBarButtonItem *myBarButtonItem = [[UIBarButtonItem alloc] init];
        myBarButtonItem.title = @"Cancel"; // or whatever text you want
        self.navigationItem.backBarButtonItem = myBarButtonItem;    
        
	}
    else if ([segue.identifier isEqualToString:@"segue_ABCDStudent"]) 
	{
      
        UILongPressGestureRecognizer *pressRecongnizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tableCellPressed:)];
        pressRecongnizer.minimumPressDuration = 0.5f;
        //[self.cell deleteGestureRecognizer:pressRecongnizer];        
        //NSLog(@"Setting RolesTVC as a delegate of AddRolesTVC");
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        Student *info = [_studentList objectAtIndex:indexPath.row];        
        
        
        
        [managedObjectContext deleteObject:info];
          
        NSError *error;
        UIBarButtonItem *myBarButtonItem = [[UIBarButtonItem alloc] init];
        myBarButtonItem.title = @"Back"; // or whatever text you want
        self.navigationItem.backBarButtonItem = myBarButtonItem;         
        if (![self.managedObjectContext save:&error])
        {
            NSLog(@"oops, couldn't save: %@", [error localizedDescription]); 
        }    
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription
                                       entityForName:@"Student" inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entity];
        self._studentList = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
                        
        [self.tableView reloadData];        
    }
    
    else if ([segue.identifier isEqualToString:@"segue_ViewStudent"])
	{
        //NSLog(@"Setting RolesTVC as a delegate of AddRolesTVC");
        
        AddStudentTVC *viewStudentTVC = segue.destinationViewController;
        viewStudentTVC.managedObjectContext = self.managedObjectContext;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        viewStudentTVC.studentInfo = [_studentList objectAtIndex:indexPath.row];
        viewStudentTVC.delegate = self;
        
      

	}
    
   
   
    
}

@end
