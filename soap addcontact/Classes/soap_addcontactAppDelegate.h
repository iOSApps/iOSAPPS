//
//  soap_addcontactAppDelegate.h
//  soap addcontact
//
//  Created by jyothsna on 07/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class soap_addcontactViewController;

@interface soap_addcontactAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    soap_addcontactViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet soap_addcontactViewController *viewController;

@end

