//
//  AppDelegate.m
//  JSTwitterNavigationBar
//
//  Created by Jake Sieradzki on 02/08/2015.
//  Copyright (c) 2015 Jake Sieradzki. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [self styleApp];
  
  return YES;
}

#pragma mark - Style

- (void)styleApp {
  [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
}

@end
