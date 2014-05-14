//
//  SignupViewController.h
//  PTF
//
//  Created by Asaph Yuan on 3/22/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController <UITextFieldDelegate> 
@property (strong, nonatomic)  UITextField *signupName;
@property (strong, nonatomic)  UITextField *signupEmail;
@property (strong, nonatomic) UITextField *signupUsername;
@property (strong, nonatomic)  UITextField *signupPassword;
@property (strong, nonatomic) UITextField *homeAddress;
@property (strong, nonatomic)  UITextField *phoneNumber;
@property (strong, nonatomic)  UITextField *affiliation;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end
