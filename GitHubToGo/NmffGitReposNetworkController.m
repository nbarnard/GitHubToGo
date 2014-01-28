//
//  NmffGitReposController.m
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import "NmffGitReposNetworkController.h"
#import "NmffGitRepo.h"

@implementation NmffGitReposNetworkController


+ (NmffGitReposNetworkController*) shared {

    static dispatch_once_t pred;
    static NmffGitReposNetworkController*shared = nil;

    dispatch_once(&pred, ^{
        shared = [[NmffGitReposNetworkController alloc] init];
    });

    return shared;
}

-(NSArray *) getReposWithSearchString: (NSString *) searchString {
    // build the search string
    NSString *searchURLString = [@"https://api.github.com/search/repositories?q=" stringByAppendingString: searchString];
    NSURL *searchURL = [NSURL URLWithString:searchURLString];

    // Get data with the Search String
    NSData *searchData = [NSData dataWithContentsOfURL: searchURL];
    NSError *error;
    NSDictionary *rawJSONData = [NSJSONSerialization JSONObjectWithData:searchData options: NSJSONReadingMutableContainers error:&error];

    // Extract the search data into Git Repo objects
    NSArray *repos = [rawJSONData objectForKey:@"items"];
    NSMutableArray *repoObjects = [NSMutableArray new];

    for (NSDictionary *currentRepo in repos) {
        NmffGitRepo *newRepo = [[NmffGitRepo alloc] initWithName: [currentRepo objectForKey:@"name"]
                                                          andURL: [NSURL URLWithString: [currentRepo objectForKey:@"html_url"]]];
        [repoObjects addObject:newRepo];
    }

    return [NSArray arrayWithArray:repoObjects];
}

@end
