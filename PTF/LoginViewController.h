//
//  LoginViewController.h
//  PTF
//
//  Created by Asaph Yuan on 3/22/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic)  UITextField *loginUsername;
@property (strong, nonatomic)  UITextField *loginPassword;
@end
