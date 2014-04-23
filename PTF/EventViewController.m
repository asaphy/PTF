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
    
    PFQuery *query1= [PFUser query];
    
    [query1 whereKey:@"username" equalTo:[[PFUser currentUser]username]];
    PFObject *queryRes1 = [query1 getFirstObject];
    NSString *permission = [queryRes1 objectForKey:@"permission"];
    if ([permission isEqualToString:@"1"]){
        //permission is not high enough to delete events
        self.deleteEventButton.hidden = YES;
    }
    else if ([permission isEqualToString:@"2"]){
        //highest permission
    }
    else{
        //cannot volunteer or delete events
        self.driverButton.hidden = YES;
        self.foodProviderButton.hidden = YES;
        self.chaperone1Button.hidden = YES;
        self.chaperone2Button.hidden = YES;
        self.deleteEventButton.hidden = YES;
    }
    
    
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
    PFObject *queryRes = [query getFirstObject];
    NSString *content = [queryRes objectForKey:@"driver"];

    if ([[queryRes objectForKey:@"driver"]  isEqual: @""]) {
        // the object has no value for key driver
    }
    else{
        //display name of volunteer, hide button
        _driverName.text = (content);
        _driverName.hidden=NO;
        _driverButton.hidden=YES;
    }
    
    NSString *content2 = [queryRes objectForKey:@"foodProvider"];
    
    if ([[queryRes objectForKey:@"foodProvider"]  isEqual: @""]) {
        // the object has no value for key driver
    }
    else{
        //display name of volunteer, hide button
        _foodProviderName.text = (content2);
        _foodProviderName.hidden=NO;
        _foodProviderButton.hidden=YES;
    }
    
    NSString *content3 = [queryRes objectForKey:@"chaperone1"];
    
    if ([[queryRes objectForKey:@"chaperone1"]  isEqual: @""]) {
        // the object has no value for key driver
    }
    else{
        //display name of volunteer, hide button
        _chaperone1Name.text = (content3);
        _chaperone1Name.hidden=NO;
        _chaperone1Button.hidden=YES;
    }
    
    NSString *content4 = [queryRes objectForKey:@"chaperone2"];
    
    if ([[queryRes objectForKey:@"chaperone2"]  isEqual: @""]) {
        // the object has no value for key driver
    }
    else{
        //display name of volunteer, hide button
        _chaperone2Name.text = (content4);
        _chaperone2Name.hidden=NO;
        _chaperone2Button.hidden=YES;
    }
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
            
            PFQuery *query= [PFUser query];
            
            [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
            PFObject *queryRes = [query getFirstObject];
            NSString *content = [queryRes objectForKey:@"signupName"];
            [driver setObject:content forKey:@"driver"];
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
            // Found Food Provider
            
            PFQuery *query= [PFUser query];
            
            [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
            PFObject *queryRes = [query getFirstObject];
            NSString *content = [queryRes objectForKey:@"signupName"];
            [foodProvider setObject:content forKey:@"foodProvider"];
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
            // Found Chaperone 1
            
            PFQuery *query= [PFUser query];
            
            [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
            PFObject *queryRes = [query getFirstObject];
            NSString *content = [queryRes objectForKey:@"signupName"];
            [chaperone1 setObject:content forKey:@"chaperone1"];
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
            // Found Chaperone 2
            
            PFQuery *query= [PFUser query];
            
            [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
            PFObject *queryRes = [query getFirstObject];
            NSString *content = [queryRes objectForKey:@"signupName"];
            [chaperone2 setObject:content forKey:@"chaperone2"];
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
