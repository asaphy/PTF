//
//  CalendarViewController.m
//  PTF
//
//  Created by Jeremy_Luo on 4/3/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController () <PDTSimpleCalendarViewDelegate>
{
    PDTSimpleCalendarViewController * calViewContainer;
}


@end

@implementation CalendarViewController

@synthesize facultyTypeSegmentedControl;


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
    calViewContainer = self.childViewControllers.lastObject;
    calViewContainer.delegate = self;
    
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

- (IBAction)logOutDetailed:(id)sender {
    [PFUser logOut];
    [self.navigationController.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)facultyTypeChanged:(UISegmentedControl *)sender
{
    /*
    NSDateComponents *components = [calViewContainer.calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:calViewContainer.today];
    
    int year = (int)[components year];
    int month = (int)[components month];
    int day = (int)[components day];
    
    NSString * d = [NSString stringWithFormat:@"%d%d%d", month,day, year];
    NSLog(@"%@",d);
     */
    switch (sender.selectedSegmentIndex) {
        case 0: // Driver
            
            break;
            
        case 1: // food provider
            
            break;
            
        case 2: // chaperone
            
            break;
            
        default:
            break;
    }
}

- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date
{
    
    NSDate *todayDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    todayDate = date;
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:@"date"];

    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:todayDate];
    NSLog(@"Todays date is %@", theDate);

    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            //no event for day, so push to volunteerView
            UIViewController * volunteerView = [self.storyboard instantiateViewControllerWithIdentifier:@"VolunteerViewController"];
            [self.navigationController pushViewController:volunteerView animated:YES];
        } else {
            //event for day exists already
            UIViewController * eventView = [self.storyboard instantiateViewControllerWithIdentifier:@"EventViewController"];
            [self.navigationController pushViewController:eventView animated:YES];
        }
    }];
    
}

@end
