//
//  NmffGitRepoDataController.h
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NmffGitRepoDataController : NSObject

-(NmffGitRepoDataController *) initWithSearchString: (NSString *)searchString;

@property (nonatomic, strong) NSArray *repos;

@end
