//
//  SegmentAppDelegate.h
//  Segment
//
//  Created by Deepak Kumar on 22/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SegmentViewController;

@interface SegmentAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SegmentViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SegmentViewController *viewController;

@end

