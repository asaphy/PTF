//
//  CalChildViewController.m
//  PTF
//
//  Created by Jeremy_Luo on 4/3/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "CalChildViewController.h"

@interface CalChildViewController ()

@end

@implementation CalChildViewController

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
    
    /*
    NSDateComponents *components = [self.calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.today];
    
    int year = (int)[components year];
    int month = (int)[components month];
    int day = (int)[components day];
    
    NSString * d = [NSString stringWithFormat:@"%d%d%d", month,day, year];
    NSLog(@"%@",d);
    */

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
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

- (void) facultyChangedTo:(int)type
{
    switch (type) {
        case 0: // driver
            
            break;
            
        case 1: // food provider
            
            break;
        
        case 2: // chaperone
            
            break;
            
        default:
            break;
    }
}

-(void)reloadCollectionView
{
    [self.collectionView reloadData];
}


@end
