//
//  EGAppDelegate.h
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGMainViewController.h"

@interface EGAppDelegate : UIResponder <UIApplicationDelegate> {
    UINavigationController *_navController;
}

@property (strong, nonatomic) UIWindow *window;

@end