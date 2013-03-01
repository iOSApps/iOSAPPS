//
//  SearchViewControllerAppDelegate.h
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

@interface SearchViewControllerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

