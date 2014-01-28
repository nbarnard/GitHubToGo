//
//  NmffGitRepo.h
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NmffGitRepo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *htmlURL;

- (NmffGitRepo *) initWithName: (NSString *) name andURL: (NSURL *) url;

@end
