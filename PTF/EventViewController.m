//
//  EventViewController.m
//  PTF
//
//  Created by Asaph Yuan on 4/4/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController

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
    _username = [[PFUser currentUser]username];
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

- (IBAction)driver:(id)sender {
    NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * driver, NSError *error) {
        if (!error) {
            // Found Driver
            [driver setObject:_username forKey:@"driver"];
            
            // Save
            [driver saveInBackground];
        } else {
            // Did not find any for the current user
            NSLog(@"Error: %@", error);
        }
    }];
}

- (IBAction)food:(id)sender {
    NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * foodProvider, NSError *error) {
        if (!error) {
            // Found Driver
            [foodProvider setObject:_username forKey:@"foodProvider"];
            
            // Save
            [foodProvider saveInBackground];
        } else {
            // Did not find any for the current user
            NSLog(@"Error: %@", error);
        }
    }];
}

- (IBAction)chaperone1:(id)sender {
    NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * chaperone1, NSError *error) {
        if (!error) {
            // Found Driver
            [chaperone1 setObject:_username forKey:@"chaperone1"];
            
            // Save
            [chaperone1 saveInBackground];
        } else {
            // Did not find any for the current user
            NSLog(@"Error: %@", error);
        }
    }];
}

- (IBAction)chaperone2:(id)sender {
    NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * chaperone2, NSError *error) {
        if (!error) {
            // Found Driver
            [chaperone2 setObject:_username forKey:@"chaperone2"];
            
            // Save
            [chaperone2 saveInBackground];
        } else {
            // Did not find any for the current user
            NSLog(@"Error: %@", error);
        }
    }];
}
@end
