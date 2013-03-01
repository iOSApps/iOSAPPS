//
//  PersonsTVC.m
//  Staff Manager
//
//  Created by Tim Roadley on 9/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PersonsTVC.h"
#import "Person.h"

@implementation PersonsTVC
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize selectedPerson;

- (void)setupFetchedResultsController
{
    // 1 - Decide what Entity you want
    NSString *entityName = @"Person"; // Put your entity name here
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    
    // 2 - Request that Entity
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    // 3 - Filter it if you want
    //request.predicate = [NSPredicate predicateWithFormat:@"Person.name = Blah"];
    
    // 4 - Sort it if you want
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"firstname"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    // 5 - Fetch it
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    [self performFetch];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"bg.png"]];
    self.tableView.opaque = NO;    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:38/256.0 green:117/256.0 blue:97/256.0 alpha:1.0]];    
    /*NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Person" inManagedObjectContext:__managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    //self.selectedPerson = [__managedObjectContext executeFetchRequest:fetchRequest error:&error];
    self.title = @"Student";*/
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupFetchedResultsController];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Persons Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Person *person = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSString *fullname = [NSString stringWithFormat:@"%@ %@", person.firstname, person.surname];
    cell.textLabel.text = fullname;
    cell.detailTextLabel.text = person.inRole.name;
    //cell.textLabel.text = person.firstname;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.tableView beginUpdates]; // Avoid  NSInternalInconsistencyException
        
        // Delete the person object that was swiped
        Person *personToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        NSLog(@"Deleting (%@)", personToDelete.firstname);
        [self.managedObjectContext deleteObject:personToDelete];
        [self.managedObjectContext save:nil];
        
        // Delete the (now empty) row on the table
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self performFetch];
        
        [self.tableView endUpdates];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"Add Person Segue"])
	{
        NSLog(@"Setting PersonsTVC as a delegate of AddPersonsTVC");
        
        AddPersonTVC *addPersonTVC = segue.destinationViewController;
        addPersonTVC.delegate = self;
        addPersonTVC.managedObjectContext = self.managedObjectContext;
	}
    else if ([segue.identifier isEqualToString:@"Person Detail Segue"])
    {
        NSLog(@"Setting PersonsTVC as a delegate of PersonDetailTVC");
        PersonDetailTVC *personDetailTVC = segue.destinationViewController;
        personDetailTVC.delegate = self;
        personDetailTVC.managedObjectContext = self.managedObjectContext;
        
        // Store selected Person in selectedPerson property
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedPerson = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        NSLog(@"Passing selected person (%@) to PersonDetailTVC", self.selectedPerson.firstname);
        personDetailTVC.person = self.selectedPerson;
    }
    else {
        NSLog(@"Unidentified Segue Attempted!");
    }
}

- (void)theSaveButtonOnTheAddPersonTVCWasTapped:(AddPersonTVC *)controller
{
    // do something here like refreshing the table or whatever
    
    
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
}

- (void)theSaveButtonOnThePersonDetailTVCWasTapped:(PersonDetailTVC *)controller
{
    // do something here like refreshing the table or whatever
    
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];    
}
@end
