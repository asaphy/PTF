//
//  CalendarViewController.m
//  PTF
//
//  Created by Jeremy_Luo on 4/3/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalChildViewController.h"

@interface CalendarViewController () <PDTSimpleCalendarViewDelegate>

@property (nonatomic) CalChildViewController * calViewContainer;

@property (strong, nonatomic) NSMutableArray *redDates;
@property (strong, nonatomic) NSMutableArray *greenDates;

@property (strong, nonatomic) NSString *typeOfVolunteer;
@property (strong, nonatomic) NSString *typeOfVolunteer2;


@end

@implementation CalendarViewController

@synthesize facultyTypeSegmentedControl;
@synthesize calView;

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
    self.calViewContainer = self.childViewControllers.lastObject;
    self.calViewContainer.delegate = self;
    
    //nav colors
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    [[UISegmentedControl appearance] setTintColor: [UIColor colorWithRed:123.0/255.0 green:63.0/255.0 blue:0.0/255.0 alpha:1]];

    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]} forState:UIControlStateNormal];
    
    self.redDates = [[NSMutableArray alloc] init];
    self.greenDates = [[NSMutableArray alloc] init];
    self.typeOfVolunteer = [[NSString alloc] init];
    self.typeOfVolunteer2 = [[NSString alloc] init];
    self.typeOfVolunteer = @"driver";
    
    //Parse query
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKeyExists:(self.typeOfVolunteer)];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            // Do something with the found objects
            for (PFObject *object in objects) {
                if ([[object objectForKey:self.typeOfVolunteer] isEqual: @""]){
                    [self.redDates addObject:[object objectForKey:@"date"]];
                }
                else{
                    [self.greenDates addObject:[object objectForKey:@"date"]];
                }
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        [self.calViewContainer reloadCollectionView];
    }];

    
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
    
    if (sender.selectedSegmentIndex == 0) {
        self.typeOfVolunteer = @"driver";
        self.redDates = [[NSMutableArray alloc] init];
        self.greenDates = [[NSMutableArray alloc] init];
        //Parse query
        PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
        [query whereKeyExists:(self.typeOfVolunteer)];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                // Do something with the found objects
                for (PFObject *object in objects) {
                    if ([[object objectForKey:self.typeOfVolunteer] isEqual: @""]){
                        [self.redDates addObject:[object objectForKey:@"date"]];
                    }
                    else{
                        [self.greenDates addObject:[object objectForKey:@"date"]];
                    }
                }
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            
            [self.calViewContainer reloadCollectionView];
        }];
        
    }
    
    if (sender.selectedSegmentIndex == 1) {
        self.typeOfVolunteer = @"foodProvider";
        self.redDates = [[NSMutableArray alloc] init];
        self.greenDates = [[NSMutableArray alloc] init];
        
        //Parse query
        PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
        [query whereKeyExists:(self.typeOfVolunteer)];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                // Do something with the found objects
                for (PFObject *object in objects) {
                    if ([[object objectForKey:self.typeOfVolunteer] isEqual: @""]){
                        [self.redDates addObject:[object objectForKey:@"date"]];
                    }
                    else{
                        [self.greenDates addObject:[object objectForKey:@"date"]];
                    }
                }
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            [self.calViewContainer reloadCollectionView];
        }];
        
    }
    
    if (sender.selectedSegmentIndex == 2) {
        self.typeOfVolunteer = @"chaperone1";
        self.typeOfVolunteer2 = @"chaperone2";
        self.redDates = [[NSMutableArray alloc] init];
        self.greenDates = [[NSMutableArray alloc] init];
        //Parse query
        PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
        [query whereKeyExists:(self.typeOfVolunteer)];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                // Do something with the found objects
                for (PFObject *object in objects) {
                    if ([[object objectForKey:self.typeOfVolunteer] isEqual: @""]){
                        [self.redDates addObject:[object objectForKey:@"date"]];
                    }
                    if ([[object objectForKey:self.typeOfVolunteer2] isEqual: @""]){
                        [self.redDates addObject:[object objectForKey:@"date"]];
                    }
                    else{
                        [self.greenDates addObject:[object objectForKey:@"date"]];
                    }
                }
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            
            [self.calViewContainer reloadCollectionView];
        }];
    }
    
    
    //[self.view setNeedsDisplay];
    
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
                VolunteerViewController * volunteerView = [self.storyboard instantiateViewControllerWithIdentifier:@"VolunteerViewController"];
                [self.navigationController pushViewController:volunteerView animated:YES];
                 volunteerView.delegate = self;
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
                VolunteerViewController * volunteerView = [self.storyboard instantiateViewControllerWithIdentifier:@"VolunteerViewController"];
                [self.navigationController pushViewController:volunteerView animated:YES];
                 volunteerView.delegate = self;
            } else {
                //event for day exists already
                UIViewController * eventView = [self.storyboard instantiateViewControllerWithIdentifier:@"EventViewController"];
                [self.navigationController pushViewController:eventView animated:YES];
            }
        }];
    }
    
    
    
    
}

#pragma mark - CalendarDelegate

-(BOOL)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller shouldUseCustomColorsForDate:(NSDate *)date
{
    return YES;
}

- (UIColor *)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller circleColorForDate:(NSDate *)date
{
    NSDate *today = [NSDate dateWithTimeIntervalSinceNow: -(60.0f*60.0f*24.0f)];
    NSComparisonResult result;
    //has three possible values: NSOrderedSame,NSOrderedDescending, NSOrderedAscending
    result = [today compare:date]; // comparing two dates
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *date2 = [dateFormat stringFromDate:date];
    if(result==NSOrderedAscending){
        if ([self.redDates containsObject:date2]){
            
            return [UIColor redColor];
        }
        else if ([self.greenDates containsObject:date2]){
            
            return [UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:0.0/255.0 alpha:1];
            
        }
        else{
            return [UIColor whiteColor];
        }
    }
    else if(result==NSOrderedDescending){
        return [UIColor whiteColor];
    }
    else{
        if ([self.redDates containsObject:date2]){
            return [UIColor redColor];
        }
        else if ([self.greenDates containsObject:date2]){
            return [UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:0.0/255.0 alpha:1];
        }
        else{
            return [UIColor whiteColor];
        }
    }
}

- (UIColor *)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller textColorForDate:(NSDate *)date
{
    NSDate *today = [NSDate dateWithTimeIntervalSinceNow: -(60.0f*60.0f*24.0f)];
    NSComparisonResult result;
    //has three possible values: NSOrderedSame,NSOrderedDescending, NSOrderedAscending
    result = [today compare:date]; // comparing two dates
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *date2 = [dateFormat stringFromDate:date];
    
    if(result==NSOrderedAscending){
        if ([self.redDates containsObject:date2]){
            return [UIColor whiteColor];
        }
        else if ([self.greenDates containsObject:date2]){
            return [UIColor whiteColor];
        }
        else{
            return [UIColor blackColor];
        }
    }
    else if(result==NSOrderedDescending){
        return [UIColor grayColor];
    }
    else{
        if ([self.redDates containsObject:date2]){
            return [UIColor whiteColor];
        }
        else if ([self.greenDates containsObject:date2]){
            return [UIColor whiteColor];
        }
        else{
            return [UIColor blackColor];
        }
    }
}

-(void)voluneteerViewControllerDidFinishUnloading:(VolunteerViewController *)vc
{
    [self.calViewContainer reloadCollectionView];
}

@end