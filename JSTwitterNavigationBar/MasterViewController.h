//
//  MasterViewController.h
//  JSTwitterNavigationBar
//
//  Created by Jake Sieradzki on 02/08/2015.
//  Copyright (c) 2015 Jake Sieradzki. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController
@property (strong, nonatomic) DetailViewController *detailViewController;
@end

