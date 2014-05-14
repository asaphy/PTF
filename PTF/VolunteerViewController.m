//

//  VolunteerViewController.m

//  PTF

//

//  Created by Jeremy_Luo on 4/3/14.

//  Copyright (c) 2014 Global App Initiative. All rights reserved.

//



#import "VolunteerViewController.h"



@interface VolunteerViewController ()



@end



@implementation VolunteerViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Custom initialization
        
    }
    
    return self;
    
}



- (void)viewDidLoad

{
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    PFQuery *query= [PFUser query];
    
    
    
    [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
    
    PFObject *queryRes = [query getFirstObject];
    
    NSString *permission = [queryRes objectForKey:@"permission"];
    
    if ([permission isEqualToString:@"2"]){
        
        //permission is high enough to create event
        
    }
    
    else{
        
        //hide create event button
        
        self.addEventButton.hidden = YES;
        
    }
    
    
    
    
    
    
    
    NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"M/d/yyyy"];
    
    
    
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    
    self.dateFromCal = theDate;
    
    NSArray *data = [[NSArray alloc] initWithObjects: @"Zion Lutheran Church", @"Christ Church Parish", @"Church of the Pilgrimage", @"First Baptist", nil];
    
    NSArray *startTime = [[NSArray alloc] initWithObjects: @"5pm", @"6pm", @"7pm", @"8pm", @"9pm", @"10pm", @"11pm", nil];
    
    self.navigationItem.title = theDate;
    
    self.array = data;
    
    self.startTimeArray = startTime;
    
    
    
    CGRect textfieldFrame = CGRectMake(5.0, 130.0, 310.0, 49.0);
    
    _contactName = [[UITextField alloc] initWithFrame:textfieldFrame];
    
    _contactName.borderStyle = UITextBorderStyleLine;
    
    _contactName.font = [UIFont systemFontOfSize:18];
    
    _contactName.placeholder = @"Event Contact Name";
    
    _contactName.alpha = 1;
    
    _contactName.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _contactName.keyboardType = UIKeyboardTypeDefault;
    
    _contactName.returnKeyType = UIReturnKeyNext;
    
    _contactName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _contactName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    _contactName.delegate = self;
    
    _contactName.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    
    
    
    [self.view addSubview:_contactName];
    
    
    
    CGRect textfieldFrame2 = CGRectMake(5.0, 180.0, 310.0, 49.0);
    
    _contactNumber = [[UITextField alloc] initWithFrame:textfieldFrame2];
    
    _contactNumber.borderStyle = UITextBorderStyleLine;
    
    _contactNumber.font = [UIFont systemFontOfSize:18];
    
    _contactNumber.placeholder = @"Event Contact Number";
    
    _contactNumber.alpha = 1;
    
    _contactNumber.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _contactNumber.keyboardType = UIKeyboardTypeDefault;
    
    _contactNumber.returnKeyType = UIReturnKeyGo;
    
    _contactNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _contactNumber.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    _contactNumber.delegate = self;
    
    _contactNumber.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    
    
    
    [self.view addSubview:_contactNumber];
    
    
    
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"eventbackground.png"]];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0];
    
    
    
}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.delegate voluneteerViewControllerDidFinishUnloading:self];
}

- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}



/*
 
 #pragma mark - Navigation
 
 
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 
 {
 
 // Get the new view controller using [segue destinationViewController].
 
 // Pass the selected object to the new view controller.
 
 }
 
 */



- (IBAction)addEvent:(id)sender {
    
    //check if fields are filled in
    
    if ([self.contactName.text isEqualToString:@""]){
        
        UIAlertView *error1 = [[UIAlertView alloc] initWithTitle:@"Contact Name Required" message:@"Please enter a contact name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        
        
        [error1 show];
        
        [self.contactName becomeFirstResponder];
        
    }
    
    else if ([self.contactNumber.text isEqualToString:@""]){
        
        UIAlertView *error2 = [[UIAlertView alloc] initWithTitle: @"Contact Number Required" message:@"Please enter a contact number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        
        
        [error2 show];
        
        [self.contactNumber becomeFirstResponder];
        
    }
    
    
    
    else {
        
        // getting an NSDate
        
        NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
        
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        
        
        NSString *theDate = [dateFormat stringFromDate:tmpDate];
        
        
        
        NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
        
        [timeFormat setDateFormat:@"HH"];
        
        
        
        //NSString *theTime = [timeFormat stringFromDate:_selectedDate];
        
        
        
        NSString *select = [_array objectAtIndex:[_locationPicker selectedRowInComponent:0]];
        
        NSString *eventStartTime = [_startTimeArray objectAtIndex:[_timePicker selectedRowInComponent:0]];
        
        
        
        //push to Parse!
        
        PFObject *eventDates = [PFObject objectWithClassName:@"EventDates"];
        
        eventDates[@"location"] = select;
        
        eventDates[@"date"] = theDate;
        
        eventDates[@"time"] = eventStartTime;
        
        eventDates[@"contactName"] = _contactName.text;
        
        eventDates[@"contactNumber"] = _contactNumber.text;
        
        eventDates[@"driver"] = @"";
        
        eventDates[@"foodProvider"] = @"";
        
        eventDates[@"chaperone1"] = @"";
        
        eventDates[@"chaperone2"] = @"";
        
        
        
        [eventDates saveInBackground];
        
        
        
        NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully added an event at %@ on %@ starting at %@!", select, theDate, eventStartTime];
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        
        
        [alert show];
        
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
}





#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
    
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        
        return self.array.count;
        
    }else
        
    {
        
        return self.startTimeArray.count;
        
    }
    
    return 0;
    
}





//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component {

//    if([pickerView isEqual: _locationPicker])    {

//        return [_array objectAtIndex:row];

//    }

//    else if([pickerView isEqual: _timePicker])

//    {

//        return [_startTimeArray objectAtIndex:row];

//    }

//    return 0;

//}





-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component

{
    
    if (component == 0) {
        
        return 250;
        
    }else if(component == 1)
        
    {
        
        return 45;
        
    }
    
    
    
    return 0;
    
}



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    
    UILabel *label = [[UILabel alloc] init];
    
    switch(component)
    
    {
            
        case 0:
            
        {
            
            label.text = self.array[row];
            
        }
            
            break;
            
        case 1:
            
            label.text = self.startTimeArray[row];
            
            
            
            break;
            
    }
    
    
    
    label.textColor = [UIColor whiteColor];
    
    return label;
    
    
    
}







- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == _contactName) {
        
        [textField resignFirstResponder];
        
        [_contactNumber becomeFirstResponder];
        
    } else if (textField == _contactNumber) {
        
        // getting an NSDate
        
        NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
        
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        
        
        NSString *theDate = [dateFormat stringFromDate:tmpDate];
        
        
        
        NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
        
        [timeFormat setDateFormat:@"HH"];
        
        
        
        //NSString *theTime = [timeFormat stringFromDate:_selectedDate];
        
        
        
        NSString *select = [_array objectAtIndex:[_locationPicker selectedRowInComponent:0]];
        
        NSString *eventStartTime = [_startTimeArray objectAtIndex:[_timePicker selectedRowInComponent:0]];
        
        
        
        //push to Parse!
        
        PFObject *eventDates = [PFObject objectWithClassName:@"EventDates"];
        
        eventDates[@"location"] = select;
        
        eventDates[@"date"] = theDate;
        
        eventDates[@"time"] = eventStartTime;
        
        eventDates[@"contactName"] = _contactName.text;
        
        eventDates[@"contactNumber"] = _contactNumber.text;
        
        eventDates[@"driver"] = @"";
        
        eventDates[@"foodProvider"] = @"";
        
        eventDates[@"chaperone1"] = @"";
        
        eventDates[@"chaperone2"] = @"";
        
        
        
        [eventDates saveInBackground];
        
        
        
        NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully added an event at %@ on %@ starting at %@!", select, theDate, eventStartTime];
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        
        
        [alert show];
        
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    return YES;
    
}



@end



