//
//  SignupViewController.m
//  PTF
//
//  Created by Asaph Yuan on 3/22/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>

@interface SignupViewController ()


@end

@implementation SignupViewController

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
    self.signupPassword.secureTextEntry = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerUser:(id)sender {
    
    PFUser * user = [PFUser user];
    user[@"firstname"] = self.signupFirstname.text;
    user[@"lastname"] = self.signupLastname.text;
    user.username = self.signupUsername.text;
    user.username = self.signupUsername.text;
    user.email = self.signupEmail.text;
    user.password = self.signupPassword.text;

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded)
        {
            self.statusLabel.text = @"Registration Succeeded!";
            [self.signupPassword resignFirstResponder];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else
        {
            self.statusLabel.text = @"Please Try Again";
            [self.signupPassword resignFirstResponder];
        }
    }];
}

- (IBAction)backToLogin:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
