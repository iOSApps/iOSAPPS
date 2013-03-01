//
//  ComboBox.h
//
//  Created by Dor Alon on 12/17/11.
//  http://doralon.net

#import <UIKit/UIKit.h>

@interface ComboBox : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    UIPickerView* pickerView;
    IBOutlet UITextField* textField;
    NSMutableArray *dataArray;
}

-(void) setComboData:(NSMutableArray*) data; //set the picker view items
@property (retain, nonatomic) NSString* selectedText; //the UITextField text

@end
