//
//  CalChildViewController.h
//  PTF
//
//  Created by Jeremy_Luo on 4/3/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "PDTSimpleCalendarViewController.h"
#import <Parse/Parse.h>

@interface CalChildViewController : PDTSimpleCalendarViewController

- (void) facultyChangedTo:(int)type;


-(void) reloadCollectionView;


@end
