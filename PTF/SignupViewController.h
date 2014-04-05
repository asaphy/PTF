//
//  SignupViewController.h
//  PTF
//
//  Created by Asaph Yuan on 3/22/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *signupFirstname;
@property (strong, nonatomic) IBOutlet UITextField *signupLastname;
@property (strong, nonatomic) IBOutlet UITextField *signupUsername;
@property (strong, nonatomic) IBOutlet UITextField *signupEmail;
@property (strong, nonatomic) IBOutlet UITextField *signupPassword;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end
