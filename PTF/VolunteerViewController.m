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
    NSArray *data = [[NSArray alloc] initWithObjects:@"Zion Lutheran Church", @"Christ Church Parish", @"Church of the Pilgrimage", @"First Baptist", nil];
    NSArray *startTime = [[NSArray alloc] initWithObjects:@"5pm", @"6pm", @"7pm", @"8pm", @"9pm", @"10pm", @"11pm", nil];
    
    self.array = data;
    self.startTimeArray = startTime;
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
    [eventDates saveInBackground];
    
    NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully added an event at %@ on %@ starting at %@!", select, theDate, eventStartTime];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
    
}


#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if([pickerView isEqual: _locationPicker])
    {
        return _array.count;
    }
    else if([pickerView isEqual: _timePicker])
    {
        return _startTimeArray.count;
    }
    return 0;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component {
    if([pickerView isEqual: _locationPicker])    {
        return [_array objectAtIndex:row];
    }
    else if([pickerView isEqual: _timePicker])
    {
        return [_startTimeArray objectAtIndex:row];
    }
    return 0;
}


//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    
//    return 1;
//    
//}
//
//
//- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
//    if ([thePickerView isEqual: _locationPicker]) {
//        return [_array count];
//    } else if ([thePickerView isEqual: _timePicker]) {
//        NSLog(@"hey");
//        return [_startTimeArray count];
//    }
//    return 0;
//    
//}
//
//#pragma mark Picker Delegate Methods
//
//-(NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    if ([thePickerView isEqual: _locationPicker]) {
//        return [_array objectAtIndex:row];
//    }
//    else if ([thePickerView isEqual: _timePicker]) {
//        NSLog(@"hey");
//        return [_startTimeArray objectAtIndex:row];
//    }
//    return 0;
//}

@end
