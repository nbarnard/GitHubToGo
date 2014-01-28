//
//  NmffGitRepo.m
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import "NmffGitRepo.h"

@implementation NmffGitRepo

- (NmffGitRepo *) initWithName: (NSString *) name andURL: (NSURL *) url {
    self = [super init];
    if (self != nil) {
        _htmlURL = url;
        _name = name;
    }
    return self;
}

@end
