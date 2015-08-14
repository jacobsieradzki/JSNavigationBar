# JSNavigationBar
'JSNavigationBar' is an implementation of Twitter's navigation bar from the profile tab in their iOS app.

# Implementation
 
 To put this into your view controller, there are 3 steps:
 
 1. Put these lines of code into your viewDidLoad method:
 ```Objective-C
 self.jsNavBar = [[JSNavigationBar alloc] initOnController:self tableView:self.tableView subtitle:YES];
 self.jsNavBar.titleText = @"Your title!";
 self.jsNavBar.subtitleText = @"Any subtitle you want...";
```
 
 2. Put this linke of code into your viewWillDisappear method:
 ```Objective-C
 [self.jsNavBar viewWillDisappearResponder];
 ```
 
 3. Put this line of code into your scrollViewDidScroll method:
 ```Objective-C
 [self.jsNavBar tableViewDidScrollResponder];
 ```
 (Note that if you are not using a UITableViewController then you will need to put the UITableViewDelegate into your view controller)
 
 # Personalization
 
 During any point (most likely after the init method) you can edit optional parameters for personalization:
 
 ```Objective-C
 @property (nonatomic, strong) UILabel *titleLabel;
 @property (nonatomic, strong) UILabel *subtitleLabel;

 @property (nonatomic, assign) bool whiteStatusBar;
 @property (nonatomic, assign) bool hideNavBarBackground;
 @property (nonatomic, strong) UIImage *backgroundImage;
 @property (nonatomic, assign) CGFloat blurEffectOpacity;
 ```
