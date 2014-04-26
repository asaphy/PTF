//
//  ContactViewController.h
//  PTF
//
//  Created by Asaph Yuan on 3/21/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>

@interface ContactViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)showEmail:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *todayContact;
@property (weak, nonatomic) IBOutlet UILabel *todayNumber;
@property (strong, nonatomic) NSString *dateFromCal;

@end
