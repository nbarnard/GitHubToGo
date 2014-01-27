//
//  NmffMasterViewController.h
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NmffDetailViewController;

@interface NmffMasterViewController : UITableViewController

@property (strong, nonatomic) NmffDetailViewController *detailViewController;

@end
