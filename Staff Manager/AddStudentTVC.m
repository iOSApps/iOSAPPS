//
//  AddStudentTVC.m
//  StudentManager
//
//  Created by Sushma Kini on 18/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
    
    
#import "AddStudentTVC.h"

@implementation AddStudentTVC
@synthesize delegate;

//@synthesize txtnotes;
@synthesize managedObjectContext;// = __managedObjectContext;
@synthesize studentInfo;
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
   //UIImage *image1 = [UIImage imageNamed:@"add.png"];
    //[[UIBarButtonItem appearance] setBackButtonBackgroundImage:image1 forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];    
    
    [super viewDidLoad];    
}

- (void)viewDidUnload
{
    btnsave = nil;
    
    
    txtphonenum = nil;
    txtlname = nil;
    btnGradeA = nil;
    btnGradeAplus = nil;
    btnGradeA = nil;
    btnGradeB = nil;
    btnGradeC = nil;
    btnGradeD = nil;
    [super viewDidUnload];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    
    if (self.studentInfo)        
    {    
                 
        self.title = @"Student Details";        
        txtfname.text = [self.studentInfo student_fname];
        txtlname.text = [self.studentInfo student_lname];        
        txtemail.text = [self.studentInfo student_email]; 
        txtdob.text= [self.studentInfo student_dob];
        txtcourse.text = [self.studentInfo student_course];
        txtnotes.text = [self.studentInfo student_notes];
        txtphonenum.text = [self.studentInfo student_phone];
        //txtphonenum.tag =*([self.studentInfo student_phone]); 
        //[managedObjectContext setValue:txtphonenum.text forKey:@"student_phone"];
       
        
        
        [txtfname setEnabled:NO];
        [txtlname setEnabled:NO];        
        [txtemail setEnabled:NO]; 
        [txtcourse setEnabled:NO];
        [txtnotes setEnabled:NO];
        [txtdob setEnabled:NO];
        [txtphonenum setEnabled:NO];
                        
        [btnsave setTitle:@"Edit"];
          
     }
}


- (IBAction)save:(id)sender
{
    if(btnsave.title==@"Update")
    {
        self.studentInfo.student_fname = txtfname.text;
        self.studentInfo.student_lname = txtlname.text;
        self.studentInfo.student_email = txtemail.text;
        self.studentInfo.student_notes = txtnotes.text;
        self.studentInfo.student_course = txtcourse.text;
        self.studentInfo.student_phone =  txtphonenum.text;        
        self.studentInfo.student_dob = txtdob.text;
        //self.studentInfo.student_phone = [NSInteger16AttributeType];
        //self.studentInfo.student_phone = [NSDecimalNumber decimalNumberWithString:txtphonenum.text];
        //[managedObjectContext setValue:txtphonenum.text forKey:@"student_phone"];
        //[managedObjectContext setValue:txtdob.text forKey:@"student_dob"];
        
        
        NSError *error;
        if (![self.managedObjectContext save:&error])
        {
            NSLog(@"oops, couldn't save: %@", [error localizedDescription]); 
        }    
        
        [self.delegate theSaveButtonOnTheAddStudentTVCWasTapped:self];
    }
    else if(btnsave.title==@"Edit") 
    {
        
        //btnsave.enabled=NO;
        // create a toolbar to have two buttons in the right
        [txtfname setEnabled:YES];
        [txtlname setEnabled:YES];        
        [txtemail setEnabled:YES];  
        [txtcourse setEnabled:YES];
        [txtdob setEnabled:YES];
        [txtnotes setEnabled:YES]; 
        [txtphonenum setEnabled:YES];
        
        [btnsave setTitle:@"Update"];
    }
    else
    {
         Student *info = [NSEntityDescription
                          insertNewObjectForEntityForName: @"Student" 
                          inManagedObjectContext: self.managedObjectContext];
           
         info.student_fname = txtfname.text;
         info.student_lname = txtlname.text;
         info.student_email = txtemail.text;
         info.student_course = txtcourse.text;
         info.student_notes = txtnotes.text;
         info.student_phone= txtphonenum.text;
       // [managedObjectContext setValue:txtphonenum.text forKey:@"student_phone"];
        
        
        info.student_dob = txtdob.text;
        //info.student_phone = txtphonenum.text;
         //self.studentInfo.student_phone = [NSDecimalNumber decimalNumberWithString:txtphonenum.text];
         NSError *error;
         if (![self.managedObjectContext save:&error])
         {
             NSLog(@"oops, couldn't save: %@", [error localizedDescription]); 
         }    
            
         [self.delegate theSaveButtonOnTheAddStudentTVCWasTapped:self];
     }
}

@end
      
  