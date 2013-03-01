//
//  TutorialProjectAppDelegate.h
//  TutorialProject
//
//  Created by Ondrej Rafaj on 5.8.09.
//  Copyright Home 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TutorialProjectViewController;

@interface TutorialProjectAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TutorialProjectViewController *viewController;
	
	// ------ Tutorial code starts here ------
	
	
	// ------ Tutorial code ends here ------
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TutorialProjectViewController *viewController;

// ------ Tutorial code starts here ------


// ------ Tutorial code ends here ------

@end

