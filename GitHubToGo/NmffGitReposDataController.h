//
//  NmffGitReposController.h
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NmffGitReposDataController : NSObject

-(NSArray *) getReposWithSearchString: (NSString *) searchString;


@end
