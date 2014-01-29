//
//  NmffDetailViewController.m
//  GitHubToGo
//
//  Created by Nicholas Barnard on 1/27/14.
//  Copyright (c) 2014 NMFF Development. All rights reserved.
//

#import "NmffDetailViewController.h"

@interface NmffDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (weak, nonatomic) IBOutlet UIWebView *detailWebView;
- (void)configureView;
@end

@implementation NmffDetailViewController

#pragma mark - Managing the URL item

- (void)setCellRepo:(NmffGitRepo *)newCellRepo {
   if (_cellRepo != newCellRepo) {
        _cellRepo = newCellRepo;
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.cellRepo) {
        NSURL *blankURL = [NSURL URLWithString:@"about:blank"];
        [_detailWebView loadRequest:[NSURLRequest requestWithURL:blankURL]];

        NSURL *detailURL = self.cellRepo.htmlURL;
        self.title = self.cellRepo.name;
//        UIActivityIndicatorView *waiting = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//
//        [waiting startAnimating];
//        [waiting setColor:[UIColor blueColor]];
//
//        waiting.frame = CGRectMake((_detailWebView.bounds.size.width / 2) - (waiting.frame.size.width / 2),
//                                   (_detailWebView.bounds.size.height / 2) - (waiting.frame.size.height / 2),
//                                   waiting.frame.size.width,
//                                   waiting.frame.size.height);
//
////        [_detailWebView addSubview:waiting];
//        NSLog(@"%@", [self class]);
//        [[self view] addSubview:waiting];
//
//        //.origin = _detailWebView.frame.origin;
//        NSLog(@"%f",waiting.frame.origin.x);
//        NSLog(@"%f",waiting.frame.origin.y);
//        NSLog(@"%f",waiting.frame.size.height);
//        NSLog(@"%f",waiting.frame.size.width);


        [_detailWebView loadRequest:[NSURLRequest requestWithURL:detailURL]];
//
//        [waiting stopAnimating];
//        [waiting removeFromSuperview];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Find Repos", @"Find Repos");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
