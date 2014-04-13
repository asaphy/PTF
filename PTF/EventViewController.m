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
    
    //hide name label
    
    _driverName.hidden=YES;
    _foodProviderName.hidden=YES;
    _chaperone1Name.hidden=YES;
    _chaperone2Name.hidden=YES;
    
    NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"M/d/yyyy"];
    
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    self.dateFromCal = theDate;
    self.navigationItem.title = theDate;
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    theDate = [dateFormat stringFromDate:tmpDate];
    
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * driver, NSError *error) {
        if (!error) {
            // Found Driver
            if ([driver objectForKey:@"driver"]) {
                // the object has a value for key driver
                PFUser *user = [PFUser currentUser];
                NSString *firstnameString = [user objectForKey:@"firstname"];
                NSString *lastnameString = [user objectForKey:@"lastname"];
                
                NSString *space = @" ";
                
                NSString *fullName = [firstnameString stringByAppendingString:space];
                fullName = [fullName stringByAppendingString:lastnameString];
                _driverName.text = (fullName);
                _driverName.hidden=NO;
                _driverButton.hidden=YES;
                
//                //get First/Last Name
//                PFQuery *query = [PFQuery queryWithClassName:@"User"];
//                [query whereKey:@"username" equalTo:[PFUser currentUser]];
//                
//                [query getFirstObjectInBackgroundWithBlock:^(PFObject * driverID, NSError *error) {
//                    
//                NSString *currentDriver = driverID[@"firstname"];
//                 NSLog(@"firstname: %@", currentDriver);
//                _driverName.text = currentDriver;
//                _driverName.hidden=NO;
//                _driverButton.hidden=YES;
//                }];
            }

            // Save
            [driver saveInBackground];
        } else {
            // Did not find any for the current user
            NSLog(@"Error: %@", error);
        }
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
    
    NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully volunteered as a driver!"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
    [self.navigationController popViewControllerAnimated:YES];
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
    
    NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully volunteered as a food provider!"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
    [self.navigationController popViewControllerAnimated:YES];
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
    
    NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully volunteered as a chaperone!"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
    [self.navigationController popViewControllerAnimated:YES];
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
    
    NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully volunteered as a chaperone!"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)deleteEvent:(id)sender {
    NSDate *tmpDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSString *objectID = object.objectId;
                PFObject *object = [PFObject objectWithoutDataWithClassName:@"EventDates" objectId: objectID];
                [object deleteEventually];
            }
            NSString *title = [[NSString alloc] initWithFormat:@"You have succesfully deleted the event."];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            [alert show];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
@end
