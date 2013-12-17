//
//  EGAppDelegate.m
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import "EGAppDelegate.h"
@class EGMainViewController;

@implementation EGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    EGMainViewController *mainViewController = [[EGMainViewController alloc] initWithNibName:@"EGMainViewController" bundle: nil];
    [mainViewController setTitle: @"Foreign Numbers"];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: mainViewController];
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end