//
//  LoginViewController.m
//  PTF
//
//  Created by Asaph Yuan on 3/22/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "LoginViewController.h"
#import "CalendarViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.loginPassword.secureTextEntry = YES;
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //Check if current user exists
    PFUser * currentUser = [PFUser currentUser];
    if (currentUser) {
        [self goToLoggedInViewController];
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logIn:(id)sender {
        [PFUser logInWithUsernameInBackground:self.loginUsername.text password:self.loginPassword.text block:^(PFUser *user, NSError *error) {
            
            if (user) {
                [self goToLoggedInViewController];
            }else
            {
                UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"Log In Error" message:@"Unable to Login, please try again" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                [view show];
            }
        }];
}

-(void) goToLoggedInViewController
{
    UITabBarController * mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    NSLog(@"%@", mvc);
    [self.navigationController pushViewController:mvc animated:YES];
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

@end
