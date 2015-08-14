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

- (id)initOnController:(UIViewController *)viewController tableView:(UITableView *)tableView subtitle:(BOOL)subtitle;
- (void)tableViewDidScrollResponder;
- (void)viewWillDisappearResponder;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *subtitleText;
@property (nonatomic, assign) bool whiteStatusBar;
@property (nonatomic, assign) bool hideNavBarBackground;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, assign) CGFloat blurEffectOpacity;
@end

@interface JSNavBarStatusBarController : NSObject
+ (void)setStatusBarWhite;
+ (void)setStatusBarBlack;
@end