//
//  NmffGitRepoDataController.m
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import "NmffGitRepoDataController.h"
#import "NmffGitReposNetworkController.h"

@implementation NmffGitRepoDataController


-(NmffGitRepoDataController *) initWithSearchString: (NSString *) searchString {

    self = [super init];
    if (self != nil) {
        NmffGitReposNetworkController *networkController = [NmffGitReposNetworkController shared];
        _repos = [networkController getReposWithSearchString:searchString];
    }

    return self;

}


@end
