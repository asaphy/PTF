//
//  EventViewController.h
//  PTF
//
//  Created by Asaph Yuan on 4/4/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface EventViewController : UIViewController
- (IBAction)driver:(id)sender;
- (IBAction)food:(id)sender;
- (IBAction)chaperone1:(id)sender;
- (IBAction)chaperone2:(id)sender;
- (IBAction)deleteEvent:(id)sender;
@property (nonatomic, retain) NSString *username;

@end
