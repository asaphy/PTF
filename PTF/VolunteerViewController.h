//
//  VolunteerViewController.h
//  PTF
//
//  Created by Jeremy_Luo on 4/3/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface VolunteerViewController : UIViewController <UITextFieldDelegate> 
@property (strong, nonatomic) IBOutlet UIPickerView *locationPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *timePicker;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSString *dateFromCal;
@property (strong, nonatomic) NSArray *startTimeArray;
@property (strong, nonatomic)  UITextField *contactName;
@property (strong, nonatomic)  UITextField *contactNumber;
@property (weak, nonatomic) IBOutlet UIButton *addEventButton;

- (IBAction)addEvent:(id)sender;
@end

