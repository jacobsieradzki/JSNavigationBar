# JSNavigationBar
'JSNavigationBar' is an implementation of Twitter's navigation bar from the profile tab in their iOS app. I realise this library is far from perfect so any pull requests will be welcomed.

![Demo](https://github.com/jacobsieradzki/JSNavigationBar/blob/master/Demo.gif)

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
 ```
 
# License

You can use this freely in your projects as you wish but please email me at some point at jake@gradler.co just so I can see how you have used it, thanks.

```
The MIT License (MIT)

Copyright (c) 2015 jacobsieradzki

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
