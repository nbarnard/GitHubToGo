//
//  NmffDetailViewController.h
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NmffGitRepo.h"

@interface NmffDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NmffGitRepo *cellRepo;

@end
