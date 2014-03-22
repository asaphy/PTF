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
    
    // Initialize table data
    
    Info *info1 = [Info new];
    info1.title = @"Mission";
    info1.text = @"The mission of Plymouth Taskforce for the Homeless is to help homeless individuals with a range of services, from temporary shelter and food to providing permanent housing with supportive services. The goal is to help people who are homeless or at risk of homelessness to achieve and maintain self-sufficiency.";
    
    Info *info2 = [Info new];
    info2.title = @"Overnights of Hospitality";
    info2.text = @"Through the Overnights of Hospitality program, we provide emergency sheltering for single homeless men on a seasonal basis, beginning mid-November and continuing through the middle of March. Based on the national model developed by Charles Stroebel from Tennessee, the shelter site rotates week by week among four different congregations in the Plymouth area.";
    
    Info *info3 = [Info new];
    info3.title = @"Ways to Give";
    info3.text = @"Checks may be made payable to the Plymouth Taskforce for the Homeless and mailed to PO Box 3896, Plymouth, MA 02361. We are an all volunteer organization, so 100% of funds raised go directly to programs and services. Thank you for your generosity that allows us to continue our shared mission.";
    
    infos = [NSArray arrayWithObjects:info1, info2, info3, nil];
    
    about = [NSArray arrayWithObjects:@"Mission", @"Overnights of Hospitality", @"Ways to Give", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
