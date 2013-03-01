//
//  RootViewController.h
//  Contacts
//
//  Created by Luc Wollants on 06/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController<UISearchBarDelegate> {
    NSString *searchString;
}

@end
