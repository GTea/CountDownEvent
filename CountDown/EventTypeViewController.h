//
//  EventTypeViewController.h
//  CountDown
//
//  Created by Aaron on 14-2-3.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventTypeDelegate.h"

#define typeIconTag 1
#define typeTag 2

@interface EventTypeViewController : UITableViewController

@property (retain, nonatomic) NSArray *typeArray;
@property (strong, nonatomic) IBOutlet UITableView *eventTypeTableView;
@property(nonatomic,assign) NSObject<EventTypeDelegate> *delegate;

@end
