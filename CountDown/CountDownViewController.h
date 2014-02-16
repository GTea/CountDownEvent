//
//  CountDownViewController.h
//  CountDown
//
//  Created by Aaron on 14-1-26.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "LeftMenuViewController.h"
#import "AddNewEventViewController.h"
#import "EventDetailViewController.h"

#define titleTag 1
#define eventDayTag 2
#define leftDayTag 3
#define imageTag 4
#define eventIdTag 100

@interface CountDownViewController : UITableViewController<EventTypeDelegate>

@property (retain, nonatomic) IBOutlet UINavigationItem *titleNavItem;
@property (retain, nonatomic) NSArray *eventArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)revealMenu:(id)sender;
- (IBAction)addNewEvent:(id)sender;

@end
