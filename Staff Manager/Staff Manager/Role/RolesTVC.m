//
//  RolesTVC.m
//  Staff Manager
//
//  Created by Tim Roadley on 9/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RolesTVC.h"
#import "Role.h"

@implementation RolesTVC
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize selectedRole;


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
    }
- (void)setupFetchedResultsController
{
    // 1 - Decide what Entity you want
    NSString *entityName = @"Role"; // Put your entity name here
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    
    // 2 - Request that Entity
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    // 3 - Filter it if you want
    //request.predicate = [NSPredicate predicateWithFormat:@"Role.name = Blah"];
    
    // 4 - Sort it if you want
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    // 5 - Fetch it
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    [self performFetch];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupFetchedResultsController];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Roles Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Role *role = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = role.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.tableView beginUpdates]; // Avoid  NSInternalInconsistencyException
        
        // Delete the role object that was swiped
        Role *roleToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        NSLog(@"Deleting (%@)", roleToDelete.name);
        [self.managedObjectContext deleteObject:roleToDelete];
        [self.managedObjectContext save:nil];
        
        // Delete the (now empty) row on the table
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self performFetch];
        
        [self.tableView endUpdates];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"Add Role Segue"])
	{
        NSLog(@"Setting RolesTVC as a delegate of AddRolesTVC");
        
        AddRoleTVC *addRoleTVC = segue.destinationViewController;
        addRoleTVC.delegate = self;
        addRoleTVC.managedObjectContext = self.managedObjectContext;
	}
    else if ([segue.identifier isEqualToString:@"Role Detail Segue"])
    {
        NSLog(@"Setting RolesTVC as a delegate of RoleDetailTVC");
        RoleDetailTVC *roleDetailTVC = segue.destinationViewController;
        roleDetailTVC.delegate = self;
        roleDetailTVC.managedObjectContext = self.managedObjectContext;
        
        // Store selected Role in selectedRole property
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedRole = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        NSLog(@"Passing selected role (%@) to RoleDetailTVC", self.selectedRole.name);
        roleDetailTVC.role = self.selectedRole;
    }
    else {
        NSLog(@"Unidentified Segue Attempted!");
    }
}

- (void)theSaveButtonOnTheAddRoleTVCWasTapped:(AddRoleTVC *)controller
{
    // do something here like refreshing the table or whatever
    
    
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
}

- (void)theSaveButtonOnTheRoleDetailTVCWasTapped:(RoleDetailTVC *)controller
{
    // do something here like refreshing the table or whatever
    
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];    
}
@end
