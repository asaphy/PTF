//
//  MapViewController.m
//  PTF
//
//  Created by Asaph Yuan on 3/21/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>

@interface MapViewController (){
    
    GMSMapView *mapView_;
    
}
@end

@implementation MapViewController

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
    
    //nav colors
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate 41.9583,-70.6678 at zoom level 13
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:41.9583
                                                            longitude:-70.6678
                                                                 zoom:13];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
    marker.position = CLLocationCoordinate2DMake(41.9583, -70.6678);
    marker.title = @"Plymouth";
    marker.snippet = @"50-68 Court Street, Plymouth, MA";
    marker.map = mapView_;
    
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    marker1.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
    marker1.position = CLLocationCoordinate2DMake(41.9624747,-70.6740269);
    marker1.title = @"Christ Church Parish";
    marker1.snippet = @"149 Court Street, Plymouth, MA";
    marker1.map = mapView_;
    
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
    marker2.position = CLLocationCoordinate2DMake(41.9556684,-70.6647393);
    marker2.title = @"Church of the Pilgrimage";
    marker2.snippet = @"8 Town Square, Plymouth, MA";
    marker2.map = mapView_;
    
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    marker3.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
    marker3.position = CLLocationCoordinate2DMake(41.9488085,-70.6771664);
    marker3.title = @"First Baptist";
    marker3.snippet = @"41 Westerly Road, Plymouth, MA";
    marker3.map = mapView_;
    
    GMSMarker *marker4 = [[GMSMarker alloc] init];
    marker4.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
    marker4.position = CLLocationCoordinate2DMake(41.978376,-70.6907745);
    marker4.title = @"Zion Lutheran Church";
    marker4.snippet = @"384 Court St, Plymouth, MA";
    marker4.map = mapView_;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logOutMap:(id)sender {
    [PFUser logOut];
    [self.navigationController.navigationController popToRootViewControllerAnimated:YES];
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
