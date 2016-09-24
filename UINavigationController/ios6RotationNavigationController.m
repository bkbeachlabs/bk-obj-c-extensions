//
//  ios6RotationNavigationController.m
//  Cryptoquips
//
//  Created by Andrew King on 2013-01-06.
//  Copyright (c) 2013 BK Beach Labs. All rights reserved.
//
//

#import "ios6RotationNavigationController.h"

@implementation ios6RotationNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



// ROTATIONS

/*
 * Checks for the allowed autorotations bu looking at the most recent viewController and 
 * asking it to forward the result of its own shouldAutorotate
 */
- (BOOL)shouldAutorotate {
    return [[self.viewControllers lastObject] shouldAutorotate];
}

/*
 * Returns a list of the supported orientations in the most recent viewController.
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

/*
 * Returns the preferred interface orientation of the most recent viewController.
 */
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}


@end
