//
//  CalendarViewController.h
//  PTF
//
//  Created by Jeremy_Luo on 4/3/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PDTSimpleCalendar/PDTSimpleCalendar.h>
#import <Parse/Parse.h>
#import "VolunteerViewController.h"

@interface CalendarViewController : UIViewController <VolunteerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *facultyTypeSegmentedControl;

@property (weak, nonatomic) IBOutlet UIView *calView;

- (IBAction)facultyTypeChanged:(UISegmentedControl *)sender;
@end
