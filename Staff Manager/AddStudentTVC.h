//
//  AddStudentTVC.h
//  StudentManager
//
//  Created by Sushma Kini on 18/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@class AddStudentTVC;
@protocol AddStudentTVCDelegate <NSObject>
- (void)theSaveButtonOnTheAddStudentTVCWasTapped:(AddStudentTVC *)controller;
@end

@interface AddStudentTVC : UITableViewController
{
    IBOutlet UIBarButtonItem *btnsave;
    //IBOutlet UIBarButtonItem *btnedit;
    IBOutlet UITextField *txtfname;        
    IBOutlet UITextField *txtdob;
    IBOutlet UITextField *txtemail;   
    IBOutlet UITextField *txtcourse;
    IBOutlet UITextField *txtnotes;     
    IBOutlet UITextField *txtphonenum;    
    IBOutlet UITextField *txtlname;
    
    IBOutlet UIButton *btnGradeAplus;
    
    IBOutlet UIButton *btnGradeA;  
    
    IBOutlet UIButton *btnGradeB;
    
    IBOutlet UIButton *btnGradeC;
    
    IBOutlet UIButton *btnGradeD;
    
    
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, weak) id <AddStudentTVCDelegate> delegate;
@property (strong, nonatomic) Student *studentInfo;


-(IBAction)save:(id)sender;
/*-(IBAction)Edit:(id)sender;*/

@end
