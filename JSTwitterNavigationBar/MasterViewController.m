//
//  MasterViewController.m
//  JSTwitterNavigationBar
//
//  Created by Jake Sieradzki on 02/08/2015.
//  Copyright (c) 2015 Jake Sieradzki. All rights reserved.
//

#import "MasterViewController.h"
#import "JSNavigationBar.h"

@interface MasterViewController ()

@property (nonatomic, strong) JSNavigationBar *jsNavBar;
@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
  [self insertAddButton];
  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // ************************ Setup: Step1! ************************
  self.jsNavBar = [[JSNavigationBar alloc] initOnController:self tableView:self.tableView subtitle:YES];
  self.jsNavBar.backgroundImage = [UIImage imageNamed:@"bg_1.jpeg"];
  self.jsNavBar.whiteStatusBar = YES;
  
  // Optional parameters
  self.jsNavBar.titleLabel.textColor = [UIColor whiteColor];
  self.jsNavBar.titleLabel.font = [UIFont systemFontOfSize:20.0f weight:0.3];
  self.jsNavBar.subtitleLabel.textColor = [UIColor whiteColor];
  self.jsNavBar.subtitleLabel.font = [UIFont systemFontOfSize:13.0f];
  // ****************************************************************
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  
  // ************************ Setup: Step2! ************************
  [self.jsNavBar viewWillDisappearResponder];
  // ***************************************************************
}

// ************************ Setup: Step3! ************************
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [self.jsNavBar tableViewDidScrollResponder];
}
// ***************************************************************

#pragma mark - Other

- (void)insertAddButton {
  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
  self.navigationItem.rightBarButtonItem = addButton;
  self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)awakeFromNib {
  [super awakeFromNib];
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
  }
}

#pragma mark - Table View

- (void)insertNewObject:(id)sender {
  if (!self.objects) {
    self.objects = [[NSMutableArray alloc] init];
  }
  [self.objects insertObject:[NSDate date] atIndex:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  
  NSDate *object = self.objects[indexPath.row];
  cell.textLabel.text = [object description];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  return cell;
}

@end
