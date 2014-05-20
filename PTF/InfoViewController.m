//
//  InfoViewController.m
//  PTF
//
//  Created by Asaph Yuan on 3/21/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "InfoViewController.h"
#import "Info.h"
#import "AboutViewController.h"
#import <Parse/Parse.h>

@interface InfoViewController ()

@end

@implementation InfoViewController {
    NSArray *about;
    NSArray *infos;
}

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
    // Initialize table data
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //navbar colors
    //nav colors
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    // Initialize table data
    
    Info *info1 = [Info new];
    info1.title = @"Mission";
    info1.text = @"The mission of Plymouth Taskforce for the Homeless is to help homeless individuals with a range of services, from temporary shelter and food to providing permanent housing with supportive services. The goal is to help people who are homeless or at risk of homelessness to achieve and maintain self-sufficiency.";
    
    Info *info2 = [Info new];
    info2.title = @"Overnights of Hospitality";
    info2.text = @"Through the Overnights of Hospitality program, we provide emergency sheltering for single homeless men on a seasonal basis, beginning mid-November and continuing through the middle of March. Based on the national model developed by Charles Stroebel from Tennessee, the shelter site rotates week by week among four different congregations in the Plymouth area.";
    
    Info *info3 = [Info new];
    info3.title = @"Drivers' Role";
    info3.text = @"Individuals help with transporting the men from the pickup spot at St. Peter’s parking lot to the shelter. Time involves about one hour, 5:30-6:30 PM each night. Volunteers may sign up to assist for one or more nights per week.";
    
    Info *info4 = [Info new];
    info4.title = @"Chaperones' Role";
    info4.text = @"Two are needed each night to stay with the men. Two may be males, or one may be male and one may be female. Chaperones arrive around 6 PM and leave around 7 AM when the men leave.";
    
    Info *info5 = [Info new];
    info5.title = @"Meal Providers' Role";
    info5.text = @"Individual(s), family, or  community groups are responsible for buying, preparing, and serving a meal. Generally, the meals are prepared at home and heated at the site. All sites have a kitchen. Dinner is usually served around 6:30 PM.";
    
    Info *info6 = [Info new];
    info6.title = @"Ways to Give";
    info6.text = @"Checks may be made payable to the Plymouth Taskforce for the Homeless and mailed to PO Box 3896, Plymouth, MA 02361. We are an all volunteer organization, so 100% of funds raised go directly to programs and services. Thank you for your generosity that allows us to continue our shared mission.";
    
    infos = [NSArray arrayWithObjects:info1, info2, info3, info4, info5, info6, nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [infos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"AboutCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Info *info = [infos objectAtIndex:indexPath.row];
    cell.textLabel.text = info.title;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showInfoDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AboutViewController *destViewController = segue.destinationViewController;
        destViewController.info = [infos objectAtIndex:indexPath.row];
    }
}

- (IBAction)logOutInfo:(id)sender {
    [PFUser logOut];
    [self.navigationController.navigationController popToRootViewControllerAnimated:YES];
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

- (IBAction)websiteButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://plymouth-taskforce-homeless.org/PTH/"]];
}
@end
