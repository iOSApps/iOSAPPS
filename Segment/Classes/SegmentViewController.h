//  SegmentViewController.h
//  Segment
//
//  Created by Deepak Kumar on 22/08/09.
//  Copyright Rose India 2009. All rights reserved.

#import <UIKit/UIKit.h>


@interface SegmentViewController : UIViewController 
{

	IBOutlet UISegmentedControl *myMent;
	
}

-(void)segmentAction:(id)sender;

@end

