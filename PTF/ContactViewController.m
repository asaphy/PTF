//
//  ContactViewController.m
//  PTF
//
//  Created by Asaph Yuan on 3/21/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "ContactViewController.h"
#import <Parse/Parse.h>

@interface ContactViewController ()

@end

@implementation ContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    
    //hide today's contact labels
    _todayContact.hidden=YES;
    _todayNumber.hidden=YES;
    
    NSDate *tmpDate = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"M/d/yyyy"];
    
    NSString *theDate = [dateFormat stringFromDate:tmpDate];
    self.dateFromCal = theDate;
    self.navigationItem.title = @"Contact";
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    theDate = [dateFormat stringFromDate:tmpDate];
    
    //today's contact
    PFQuery *query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:theDate];
    [query whereKeyExists:@"contactName"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
        } else {
            // The find succeeded.
            NSString *content = [object objectForKey:@"contactName"];
            if (![content  isEqual: @""]) {
                NSString *contact = @"Today's Contact: ";
                NSString *result = [contact stringByAppendingString:content];
                _todayContact.text = (result);
                _todayContact.hidden=NO;
            }
        }
    }];
    
    
    
    PFQuery *query2 = [PFQuery queryWithClassName:@"EventDates"];
    [query2 whereKey:@"date" equalTo:theDate];
    [query2 whereKeyExists:@"contactName"];
    [query2 getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            // The find succeeded.
            NSString *content2 = [object objectForKey:@"contactNumber"];
            if (![content2  isEqual: @""]) {
                NSString *contact = @"Phone #: ";
                NSString *result = [contact stringByAppendingString:content2];
                _todayNumber.text = (result);
                _todayNumber.hidden=NO;
            }
        }
    }];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //navbar colors
    //nav colors
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    //hide today's contact labels
    _todayContact.hidden=YES;
    _todayNumber.hidden=YES;
    
    
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

- (IBAction)showEmail:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Subject Line";
    // Email Content
    NSString *messageBody = @"Email Text";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"conmel@aol.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)logMeContact:(id)sender {
    [PFUser logOut];
    [self.navigationController.navigationController popToRootViewControllerAnimated:YES];
}

@end