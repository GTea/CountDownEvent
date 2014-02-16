//
//  EventDetailViewController.m
//  CountDown
//
//  Created by Aaron on 14-2-1.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

@synthesize titleNavItem, toolbar,titleLabel;
@synthesize eventTitle, eventId;

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CountDownEvent *cdEvent = [CountDownEvent alloc];
    NSMutableDictionary *event = [cdEvent getEventWithId:eventId];

    titleNavItem.title = [event objectForKey:@"title"];
    titleLabel.text = [event objectForKey:@"title"];
    UIImage *bgImage = [UIImage imageNamed:@"paopao_bg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
