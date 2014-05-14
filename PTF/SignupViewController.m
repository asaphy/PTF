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
    
    CGRect textfieldFrame = CGRectMake(3.0, 30.0, 315.0, 34.0);
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
    
    CGRect textfieldFrame3 = CGRectMake(3.0, 65.0, 315.0, 34.0);
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
    
    CGRect textfieldFrame4 = CGRectMake(3.0, 100.0, 315.0, 34.0);
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


    CGRect textfieldFrame5 = CGRectMake(3.0, 135.0, 315.0, 34.0);
    _signupPassword = [[UITextField alloc] initWithFrame:textfieldFrame5];
    _signupPassword.borderStyle = UITextBorderStyleLine;
    _signupPassword.font = [UIFont systemFontOfSize:18];
    _signupPassword.placeholder = @"  Password";
    _signupPassword.alpha = 0.8;
    _signupPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    _signupPassword.keyboardType = UIKeyboardTypeDefault;
    _signupPassword.returnKeyType = UIReturnKeyNext;
    _signupPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    _signupPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _signupPassword.delegate = self;
    _signupPassword.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    [self.view addSubview:_signupPassword];
    
    CGRect textfieldFrame6 = CGRectMake(3.0, 170.0, 315.0, 34.0);
    _homeAddress = [[UITextField alloc] initWithFrame:textfieldFrame6];
    _homeAddress.borderStyle = UITextBorderStyleLine;
    _homeAddress.font = [UIFont systemFontOfSize:18];
    _homeAddress.placeholder = @"  Home Address";
    _homeAddress.alpha = 0.8;
    _homeAddress.autocorrectionType = UITextAutocorrectionTypeNo;
    _homeAddress.keyboardType = UIKeyboardTypeDefault;
    _homeAddress.returnKeyType = UIReturnKeyNext;
    _homeAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
    _homeAddress.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _homeAddress.delegate = self;
    _homeAddress.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    [self.view addSubview:_homeAddress];
    
    CGRect textfieldFrame7 = CGRectMake(3.0, 205, 315.0, 34.0);
    _phoneNumber = [[UITextField alloc] initWithFrame:textfieldFrame7];
    _phoneNumber.borderStyle = UITextBorderStyleLine;
    _phoneNumber.font = [UIFont systemFontOfSize:18];
    _phoneNumber.placeholder = @"  Phone Number";
    _phoneNumber.alpha = 0.8;
    _phoneNumber.autocorrectionType = UITextAutocorrectionTypeNo;
    _phoneNumber.keyboardType = UIKeyboardTypeDefault;
    _phoneNumber.returnKeyType = UIReturnKeyNext;
    _phoneNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneNumber.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _phoneNumber.delegate = self;
    _phoneNumber.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    [self.view addSubview:_phoneNumber];
    
    
    CGRect textfieldFrame8 = CGRectMake(3.0, 240, 315.0, 34.0);
    _affiliation = [[UITextField alloc] initWithFrame:textfieldFrame8];
    _affiliation.borderStyle = UITextBorderStyleLine;
    _affiliation.font = [UIFont systemFontOfSize:18];
    _affiliation.placeholder = @"  Affiliation";
    _affiliation.alpha = 0.8;
    _affiliation.autocorrectionType = UITextAutocorrectionTypeNo;
    _affiliation.keyboardType = UIKeyboardTypeDefault;
    _affiliation.returnKeyType = UIReturnKeyGo;
    _affiliation.clearButtonMode = UITextFieldViewModeWhileEditing;
    _affiliation.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _affiliation.delegate = self;
    _affiliation.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    [self.view addSubview:_affiliation];
    
    
    self.signupPassword.secureTextEntry = YES;
    self.signupUsername.delegate = self;
    self.signupEmail.delegate = self;
    self.signupPassword.delegate = self;
    self.signupName.delegate = self;
    self.homeAddress.delegate = self;
    self.phoneNumber.delegate = self;
    self.affiliation.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerUser:(id)sender {
    if ([self.signupName.text isEqualToString:@""]){
        UIAlertView *error1 = [[UIAlertView alloc] initWithTitle:@"Name Required" message:@"Please enter a name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error1 show];
        [self.signupName becomeFirstResponder];
    }
    else if ([self.signupUsername.text isEqualToString:@""]){
        UIAlertView *error1 = [[UIAlertView alloc] initWithTitle:@"Username Required" message:@"Please enter a username." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [self.signupUsername becomeFirstResponder];
        [error1 show];
    }
    else if ([self.signupEmail.text isEqualToString:@""]){
        UIAlertView *error1 = [[UIAlertView alloc] initWithTitle:@"Email Required" message:@"Please enter an email." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [self.signupEmail becomeFirstResponder];
        [error1 show];
    }
    else if ([self.signupPassword.text isEqualToString:@""]){
        UIAlertView *error1 = [[UIAlertView alloc] initWithTitle:@"Password Required" message:@"Please enter a password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [self.signupPassword becomeFirstResponder];
        [error1 show];
    }
    else{
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
            NSString *errorMessage = [error localizedDescription];
            NSLog(@"%@",errorMessage);
            self.statusLabel.text = @"Please try another username or email";
            [self.signupPassword resignFirstResponder];
        }
    }];
    }
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
        [self.homeAddress becomeFirstResponder];
    }
    else if (textField == self.homeAddress) {
        [self.phoneNumber becomeFirstResponder];
    }
    else if (textField == self.phoneNumber) {
        [self.affiliation becomeFirstResponder];
    }
    else if (textField == self.affiliation) {
        PFUser * user = [PFUser user];
        user.username = self.signupUsername.text;
        user.username = self.signupUsername.text;
        user.email = self.signupEmail.text;
        user.password = self.signupPassword.text;
        user[@"signupName"] = self.signupName.text;
        user[@"homeAddress"] = self.homeAddress.text;
        user[@"phoneNumber"] = self.phoneNumber.text;
        user[@"affiliation"] = self.affiliation.text;
        user[@"permission"] = @"1";
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
