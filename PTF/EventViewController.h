//
//  EventViewController.h
//  PTF
//
//  Created by Asaph Yuan on 4/4/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <sendgrid.h>
@interface EventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *cancelDriver;
@property (weak, nonatomic) IBOutlet UIButton *cancelFoodProvider;
@property (weak, nonatomic) IBOutlet UIButton *cancelChaperone1;
@property (weak, nonatomic) IBOutlet UIButton *cancelChaperone2;

- (IBAction)cancelDriver:(id)sender;
- (IBAction)cancelFoodProvider:(id)sender;
- (IBAction)cancelChaperone1:(id)sender;
- (IBAction)cancelChaperone2:(id)sender;



- (IBAction)driver:(id)sender;
- (IBAction)food:(id)sender;
- (IBAction)chaperone1:(id)sender;
- (IBAction)chaperone2:(id)sender;
- (IBAction)deleteEvent:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *driverButton;
@property (weak, nonatomic) IBOutlet UIButton *foodProviderButton;
@property (weak, nonatomic) IBOutlet UIButton *chaperone1Button;
@property (weak, nonatomic) IBOutlet UIButton *chaperone2Button;
@property (weak, nonatomic) IBOutlet UIButton *deleteEventButton;
@property (weak, nonatomic) IBOutlet UILabel *driverName;
@property (weak, nonatomic) IBOutlet UILabel *foodProviderName;
@property (weak, nonatomic) IBOutlet UILabel *chaperone1Name;
@property (weak, nonatomic) IBOutlet UILabel *chaperone2Name;
@property (strong, nonatomic) NSString *dateFromCal;
@property (nonatomic, retain) NSString *username;

@end
