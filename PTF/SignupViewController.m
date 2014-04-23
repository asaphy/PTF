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
    
    CGRect textfieldFrame = CGRectMake(0.0, 80.0, 320.0, 49.0);
    _signupName = [[UITextField alloc] initWithFrame:textfieldFrame];
    _signupName.borderStyle = UITextBorderStyleLine;
    _signupName.font = [UIFont systemFontOfSize:18];
    _signupName.placeholder = @"  Name";
    _signupName.alpha = 0.8;
    _signupName.autocorrectionType = UITextAutocorrectionTypeNo;
    _signupName.keyboardType = UIKeyboardTypeDefault;
    _signupName.returnKeyType = UIReturnKeyNext;
    _signupName.clearButtonMode = UITextFieldViewModeWhileEditing;
    _signupName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _signupName.delegate = self;
    _signupName.background = [UIImage imageNamed:@"textfieldbackground.jpg"];

    [self.view addSubview:_signupName];
    
    CGRect textfieldFrame3 = CGRectMake(0.0, 130.0, 320.0, 49.0);
    _signupUsername = [[UITextField alloc] initWithFrame:textfieldFrame3];
    _signupUsername.borderStyle = UITextBorderStyleLine;
    _signupUsername.font = [UIFont systemFontOfSize:18];
    _signupUsername.placeholder = @"  Username";
    _signupUsername.alpha = 0.8;
    _signupUsername.autocorrectionType = UITextAutocorrectionTypeNo;
    _signupUsername.keyboardType = UIKeyboardTypeDefault;
    _signupUsername.returnKeyType = UIReturnKeyNext;
    _signupUsername.clearButtonMode = UITextFieldViewModeWhileEditing;
    _signupUsername.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _signupUsername.delegate = self;
    _signupUsername.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    [self.view addSubview:_signupUsername];
    
    CGRect textfieldFrame4 = CGRectMake(0.0, 180.0, 320.0, 49.0);
    _signupEmail = [[UITextField alloc] initWithFrame:textfieldFrame4];
    _signupEmail.borderStyle = UITextBorderStyleLine;
    _signupEmail.font = [UIFont systemFontOfSize:18];
    _signupEmail.placeholder = @"  Email";
    _signupEmail.alpha = 0.8;
    _signupEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    _signupEmail.keyboardType = UIKeyboardTypeDefault;
    _signupEmail.returnKeyType = UIReturnKeyNext;
    _signupEmail.clearButtonMode = UITextFieldViewModeWhileEditing;
    _signupEmail.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _signupEmail.delegate = self;
    _signupEmail.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    [self.view addSubview:_signupEmail];


    CGRect textfieldFrame5 = CGRectMake(0.0, 230.0, 320.0, 50.0);
    _signupPassword = [[UITextField alloc] initWithFrame:textfieldFrame5];
    _signupPassword.borderStyle = UITextBorderStyleLine;
    _signupPassword.font = [UIFont systemFontOfSize:18];
    _signupPassword.placeholder = @"  Password";
    _signupPassword.alpha = 0.8;
    _signupPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    _signupPassword.keyboardType = UIKeyboardTypeDefault;
    _signupPassword.returnKeyType = UIReturnKeyGo;
    _signupPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    _signupPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _signupPassword.delegate = self;
    _signupPassword.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    [self.view addSubview:_signupPassword];
    
    
    self.signupPassword.secureTextEntry = YES;
    self.signupUsername.delegate = self;
    self.signupEmail.delegate = self;
    self.signupPassword.delegate = self;
    self.signupName.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerUser:(id)sender {
    
    PFUser * user = [PFUser user];
    user[@"signupName"] = self.signupName.text;
    user.username = self.signupUsername.text;
    user.username = self.signupUsername.text;
    user.email = self.signupEmail.text;
    user.password = self.signupPassword.text;
    [self.view endEditing:YES];

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded)
        {
            [self.signupPassword resignFirstResponder];
            [PFUser logInWithUsernameInBackground:self.signupUsername.text password:self.signupPassword.text block:^(PFUser *user, NSError *error) {
                
                if (user) {
                    [self goToLoggedInViewController];
                }else
                {
                    UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"Log In Error" message:@"Unable to login, please try again" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                    [view show];
                }
            }];
            
        }else
        {
            self.statusLabel.text = @"Please try another username or email";
            [self.signupPassword resignFirstResponder];
        }
    }];
}

-(void) goToLoggedInViewController
{
    UITabBarController * mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    [self.navigationController pushViewController:mvc animated:YES];
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.signupName) {
        [self.signupUsername becomeFirstResponder];
    }
    else if (textField == self.signupUsername) {
        [self.signupEmail becomeFirstResponder];
    }
    else if (textField == self.signupEmail) {
        [self.signupPassword becomeFirstResponder];
    }
    else if (textField == self.signupPassword) {
        PFUser * user = [PFUser user];
        user[@"signupName"] = self.signupName.text;
        user.username = self.signupUsername.text;
        user.username = self.signupUsername.text;
        user.email = self.signupEmail.text;
        user.password = self.signupPassword.text;
        [self.view endEditing:YES];
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(succeeded)
            {
                [self.signupPassword resignFirstResponder];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else
            {
                self.statusLabel.text = @"Please try another username or email";
                [self.signupPassword resignFirstResponder];
            }
        }];
    }
    return YES;
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
