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
    
    CGRect textfieldFrame = CGRectMake(3.0, 120.0, 315.0, 39.0);
    _loginUsername = [[UITextField alloc] initWithFrame:textfieldFrame];
    _loginUsername.borderStyle = UITextBorderStyleLine;
    _loginUsername.font = [UIFont systemFontOfSize:18];
    _loginUsername.placeholder = @" Username";
    _loginUsername.alpha = 0.8;
    _loginUsername.autocorrectionType = UITextAutocorrectionTypeNo;
    _loginUsername.keyboardType = UIKeyboardTypeDefault;
    _loginUsername.returnKeyType = UIReturnKeyNext;
    _loginUsername.clearButtonMode = UITextFieldViewModeWhileEditing;
    _loginUsername.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _loginUsername.delegate = self;
    _loginUsername.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    
    [self.view addSubview:_loginUsername];
    
    CGRect textfieldFrame2 = CGRectMake(3.0, 160.0, 315.0, 39.0);
    _loginPassword = [[UITextField alloc] initWithFrame:textfieldFrame2];
    _loginPassword.borderStyle = UITextBorderStyleLine;
    _loginPassword.font = [UIFont systemFontOfSize:18];
    _loginPassword.placeholder = @" Password";
    _loginPassword.alpha = 0.8;
    _loginPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    _loginPassword.keyboardType = UIKeyboardTypeDefault;
    _loginPassword.returnKeyType = UIReturnKeyGo;
    _loginPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    _loginPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _loginPassword.delegate = self;
    _loginPassword.background = [UIImage imageNamed:@"textfieldbackground.jpg"];
    
    [self.view addSubview:_loginPassword];
    
    
    self.loginPassword.secureTextEntry = YES;
setNavigationBarHidden:YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.loginPassword.delegate = self;
    //Check if current user exists
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    PFUser * currentUser = [PFUser currentUser];
    if (currentUser) {
        [self alreadyLoggedInViewController];
    }
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
            [self.loginPassword resignFirstResponder];
        }else
        {
            UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"Log In Error" message:@"Unable to login, please try again" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [view show];
            [self.loginPassword resignFirstResponder];
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self logIn:nil];
    return YES;
}

//- (void)textFieldDidEndEditing:(UITextField *)textField {
//[self logIn:nil];
//}

-(void)dismissKeyboard {
    [_loginUsername resignFirstResponder];
    [_loginPassword resignFirstResponder];
}

-(void) alreadyLoggedInViewController
{
    UITabBarController * mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    [self.navigationController pushViewController:mvc animated:NO];
}

-(void) goToLoggedInViewController
{
    UITabBarController * mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    [self.navigationController pushViewController:mvc animated:YES];
}
- (IBAction)goToSignUp:(id)sender {
    UIViewController * svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:svc animated:YES];
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
