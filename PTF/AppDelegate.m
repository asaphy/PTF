//
//  AppDelegate.m
//  PTF
//
//  Created by Asaph Yuan on 3/21/14.
//  Copyright (c) 2014 Global App Initiative. All rights reserved.
//
#import <Parse/Parse.h>
#import "AppDelegate.h"

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GMSServices provideAPIKey:@"AIzaSyCOaDpCAlUgNMVNyMs_t6DnBkGZIr7Iz84"];
    [Parse setApplicationId:@"BdpmFORUWoLdn2KA5Zs4hGR4i6aGBWsPWGi46hUN"
                  clientKey:@"7OknIkTlvSbBLEX0jfpby3g8K8pNQKx8FNunhNSL"];
    
    //tab bar colors
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
//    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
//    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:123.0/255.0 green:63.0/255.0 blue:0.0/255.0 alpha:1]];
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
    
    // Sets the tint color which typically sets the color of the segment images, text, dividers,
    // borders, and selected segment. A translucent version of this color is also used to tint a
    // segment when it is pressed and transitioning to being selected, as shown on the first
    // segment below.
//    [[UISegmentedControl appearance] setTintColor:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]];
    [[UISegmentedControl appearance] setTintColor: [UIColor colorWithRed:123.0/255.0 green:63.0/255.0 blue:0.0/255.0 alpha:1]];
    
    // The attributes dictionary can specify the font, text color, text shadow color, and text
    // shadow offset for the title in the text attributes dictionary
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:211.0/255.0 green:106.0/255.0 blue:18.0/255.0 alpha:1]} forState:UIControlStateNormal];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
