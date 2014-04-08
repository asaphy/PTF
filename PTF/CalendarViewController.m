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

    //nav colors
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:123.0/255.0 green:63.0/255.0 blue:0.0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
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
    
    if (sender.selectedSegmentIndex == 0) {
        
        
        NSString *title = [[NSString alloc] initWithFormat:@"Driver!"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
    }
    
    if (sender.selectedSegmentIndex == 1) {
        NSString *title = [[NSString alloc] initWithFormat:@"Food Provider!"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
    }
    
    if (sender.selectedSegmentIndex == 2) {
        NSString *title = [[NSString alloc] initWithFormat:@"Chaperone!"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
    }



    
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

- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)clickedDate
{
    
    NSDate *todayDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    todayDate = clickedDate;
    [[NSUserDefaults standardUserDefaults] setObject:clickedDate forKey:@"date"];
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:todayDate];
    NSString *theToday = [dateFormat stringFromDate:today];
    
    
    
    //NSDate *today = [NSDate date];
   // NSDate *compareDate = [NSDate dateWithString:@"your date"];
    
    NSComparisonResult compareResult = [theDate compare : theToday];
    
    if (compareResult == NSOrderedAscending)
    {
        //date is passed
    }
    else if (compareResult == NSOrderedDescending)
    {
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
    else
    {
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
    
    

    
}

@end
