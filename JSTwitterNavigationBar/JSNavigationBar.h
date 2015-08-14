//
//  JSNavigationBar.h
//  JSNavigationBar
//
//  Created by Jake Sieradzki on 02/08/2015.
//  Copyright (c) 2015 Jake Sieradzki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 'JSNavigationBar' is an open source implementation of Twitter's navigation bar from the profile tab in their iOS app.
 Download link at: https://github.com/jacobsieradzki/JSNavigationBar
 */
@interface JSNavigationBar : NSObject <UITableViewDelegate>

/**
 Initializes a new instance of JSNavigationBar.
 
 @param viewController The current view controller you want the JSNavigationBar to appear on.
 @param tableView The current table view you want the appearing title and subtitle to respond to when scrolling. If you don't have a separate table view set it to self.tableView
 @param subtitle A boolean value that determines if you want a single title label or a title labe with a smaller subtitle label.
 */
- (id)initOnController:(UIViewController *)viewController tableView:(UITableView *)tableView subtitle:(BOOL)subtitle;

/**
 Call this method in your tableViewDidScroll on your view controller so that the JSNavigationBar can respond to scrolling events.
 
 @warning This method is required for JSNavigationBar to work properly.
 */
- (void)tableViewDidScrollResponder;

/** Call this method in your viewWillDisappear on your view controller so that the JSNavigationBar can be removed when you navigate to a new view controller. If you want this on multiple view controllers you will have to create it separately for each one.
 
 @warning This method is required for JSNavigationBar to work properly.
 */
- (void)viewWillDisappearResponder;

/**
 The title label that appears in your JSNavigationBar. Use this property to customize the look of the label to how you want it.
 */
@property (nonatomic, strong) UILabel *titleLabel;
/** The subtitle label that appears in your JSNavigationBar. It will not appear if you set NO in the initialize method. Use this property to customize the look of the label to how you want it.
 */
@property (nonatomic, strong) UILabel *subtitleLabel;

/** 
 The text that appears in the title label.
 
 @warning If you do not set this property then the text will be "Title Label".
 */
@property (nonatomic, strong) NSString *titleText;
/** 
 The text that appears in the subtitle label. The subtitle label will not appear if you set NO in the initialize method.
 
 @warning If you do not set this property then the text will be "Subtitle".
 */
@property (nonatomic, strong) NSString *subtitleText;
/** 
 Indicate whether you want a white status bar. YES for white or NO for black/default.
 */
@property (nonatomic, assign) bool whiteStatusBar;
/**
 Indicate whether you want the background of the navigation bar transparent. YES for transparent, NO for opaque/default.
 */
@property (nonatomic, assign) bool hideNavBarBackground;
/**
 The image in the backgorund of the navigation bar. The background image will not appear if the hideNavBarBackground property is set to YES (transparent).
 */
@property (nonatomic, strong) UIImage *backgroundImage;
@end

@interface JSNavBarStatusBarController : NSObject
/**
 Will set the status bar to white text color.
 */
+ (void)setStatusBarWhite;
/**
 Will set the status bar to black (default) text color.
 */
+ (void)setStatusBarBlack;
@end