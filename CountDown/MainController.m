//
//  InitialSlidingViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "MainController.h"

@implementation MainController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIStoryboard *storyboard;
  
  storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  
  self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationCountDown"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}

@end
