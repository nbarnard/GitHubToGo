//
//  NmffGitReposController.m
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import "NmffGitReposDataController.h"
#import "NmffGitRepo.h"

@implementation NmffGitReposDataController


+ (NmffGitReposDataController*) shared {

    static dispatch_once_t pred;
    static NmffGitReposDataController*shared = nil;

    dispatch_once(&pred, ^{
        shared = [[NmffGitReposDataController alloc] init];
    });

    return shared;
}

-(NSArray *) getReposWithSearchString: (NSString *) searchString {

// https://api.github.com/search/repositories?q=tetris+language:assembly&sort=stars&order=desc

    NSString *searchURLString = [@"https://api.github.com/search/repositories?q=" stringByAppendingString: searchString];

    NSURL *searchURL = [NSURL URLWithString:searchURLString];
    NSData *searchData = [NSData dataWithContentsOfURL: searchURL];

    NSError *error;
    NSDictionary *rawJSONData = [NSJSONSerialization JSONObjectWithData:searchData options: NSJSONReadingMutableContainers error:&error];

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
