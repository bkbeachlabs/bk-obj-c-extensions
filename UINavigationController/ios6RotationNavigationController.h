//
//  ios6RotationNavigationController.h
//  Cryptoquips
//
//  Created by Andrew King on 2013-01-06.
//  Copyright (c) 2013 BK Beach Labs. All rights reserved.
//
//

#import <UIKit/UIKit.h>

/**
 * This Sub-Class of UINavigationController uses the default configurations, except that it prevents autorotations.
 * @extends UINavigationController
 * @since 1.0
 */
@interface ios6RotationNavigationController : UINavigationController

/**
 * Checks for the allowed autorotations bu looking at the most recent viewController and asking 
 * it to forward the result of its own shouldAutorotate
 * @return TRUE if the view should autorotate, FALSE otherwise.
 */
- (BOOL) shouldAutorotate;

/**
 * @return a list of the supported orientations in the most recent viewController.
 */
- (NSUInteger) supportedInterfaceOrientations;

/**
 * @return the preferred interface orientation of the most recent viewController.
 */
- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation;

@end
