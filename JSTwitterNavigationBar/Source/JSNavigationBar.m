//
//  JSNavigationBar.m
//  JSNavigationBar
//
//  Created by Jake Sieradzki on 02/08/2015.
//  Copyright (c) 2015 Jake Sieradzki. All rights reserved.
//

#import "JSNavigationBar.h"

#define navBarHeight self.viewController.navigationController.navigationBar.frame.size.height
#define statusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define wholeNavBarHeight statusBarHeight + navBarHeight
#define screenWidth self.viewController.navigationController.navigationBar.frame.size.width

@interface JSNavigationBar ()
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIVisualEffectView *blurredEffectView;
@property (assign) BOOL shouldShowSubtitle;
@end

@implementation JSNavigationBar

- (id)initOnController:(UIViewController *)viewController tableView:(UITableView *)tableView subtitle:(BOOL)subtitle {
  if (![super init]) {
    return nil;
  }
  
  self.viewController = viewController;
  self.tableView = tableView;
  self.shouldShowSubtitle = subtitle;
  
  [self constructTitleLabel];
  [self constructSubtitleLabel];
  [self maskJSNavigationBarToBounds];
  
  return self;
}

#pragma mark - Responders

- (void)tableViewDidScrollResponder {
  CGFloat yOffset = self.tableView.contentOffset.y;
  self.titleLabel.frame = CGRectMake(0, MAX(0, -yOffset), self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
  
  const float alphaLabelOffset = 0.3;
  float alpha = MIN(1.5, MAX(0, 1 - ((-yOffset/64)*1)));
  self.blurredEffectView.alpha = 1;
  self.titleLabel.alpha = alpha-alphaLabelOffset;
  
  if (self.subtitleLabel) {
    self.titleLabel.frame = CGRectMake(0, MAX(0, -yOffset)+5, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    self.subtitleLabel.frame = CGRectMake(0, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height, self.subtitleLabel.frame.size.width, self.subtitleLabel.frame.size.height);
    self.subtitleLabel.alpha = alpha-alphaLabelOffset;
  }
}

- (void)viewWillDisappearResponder {
  [self.titleLabel removeFromSuperview];
  [self.subtitleLabel removeFromSuperview];
  [self.backgroundImageView removeFromSuperview];
  [self.blurredEffectView removeFromSuperview];
  self.viewController.navigationController.navigationBar.layer.mask = nil;
}

#pragma mark - Construction

- (void)constructTitleLabel {
  self.viewController.title = @"";
  
  self.titleLabel = [[UILabel alloc] init];
  self.titleLabel.text = @"Title Label";
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  self.titleLabel.frame = CGRectMake(0, navBarHeight, screenWidth, navBarHeight);
  self.titleText ? self.titleLabel.text = self.titleText : nil ;
  [self.viewController.navigationController.navigationBar addSubview:self.titleLabel];
}

- (void)setTitleText:(NSString *)titleText {
  self.titleLabel.text = titleText;
}

- (void)constructSubtitleLabel {
  if (self.shouldShowSubtitle) {
    self.titleLabel.frame = CGRectMake(0, navBarHeight, screenWidth, navBarHeight*0.4);
    self.subtitleLabel = [[UILabel alloc] init];
    self.subtitleLabel.text = @"Subtitle";
    self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    self.subtitleLabel.frame = CGRectMake(0, navBarHeight*1.4, screenWidth, navBarHeight*0.4);
    [self.viewController.navigationController.navigationBar addSubview:self.subtitleLabel];
    self.subtitleText ? self.subtitleLabel.text = self.subtitleText : nil;
  }
}

- (void)setSubtitleText:(NSString *)subtitleText {
  self.subtitleLabel.text = subtitleText;
}

- (void)setWhiteStatusBar:(bool)whiteStatusBar {
  whiteStatusBar ? [JSNavBarStatusBarController setStatusBarWhite] : [JSNavBarStatusBarController setStatusBarBlack];
}

- (void)setHideNavBarBackground:(bool)hideNavBarBackground {
  if (hideNavBarBackground) {
    [self.viewController.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                                 forBarMetrics:UIBarMetricsDefault];
    self.viewController.navigationController.navigationBar.shadowImage = [UIImage new];
    self.viewController.navigationController.navigationBar.translucent = YES;
  }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
  if (backgroundImage) {
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -statusBarHeight, screenWidth, wholeNavBarHeight)];
    self.backgroundImageView.image = backgroundImage;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.viewController.navigationController.navigationBar insertSubview:self.backgroundImageView atIndex:2];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.blurredEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [self.blurredEffectView setFrame:CGRectMake(-50, -50, self.backgroundImageView.frame.size.width+100, self.backgroundImageView.frame.size.height+100)];
    self.blurredEffectView.alpha = 1;
    [self.backgroundImageView addSubview:self.blurredEffectView];
  }
}

- (void)setBlurEffectOpacity:(CGFloat)blurEffectOpacity {
  if (blurEffectOpacity <= 1 && blurEffectOpacity >= 0) {
    self.blurredEffectView.alpha = blurEffectOpacity;
  }
}

- (void)maskJSNavigationBarToBounds {
  CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
  CGRect maskRect = CGRectMake(0, -statusBarHeight, screenWidth, wholeNavBarHeight);
  CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
  maskLayer.path = path;
  CGPathRelease(path);
  self.viewController.navigationController.navigationBar.layer.mask = maskLayer;
}

@end




@implementation JSNavBarStatusBarController

+ (void)setStatusBarWhite {
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

+ (void)setStatusBarBlack {
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

@end
