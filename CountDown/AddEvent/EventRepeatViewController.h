//
//  EventRepeatViewController.h
//  CountDown
//
//  Created by Aaron on 14-2-4.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventTypeDelegate.h"

#define typeIconTag 1
#define typeTag 2

@interface EventRepeatViewController : UITableViewController

@property (retain, nonatomic) NSArray *typeArray;
@property (strong, nonatomic) IBOutlet UITableView *eventRepeatTableView;
@property(nonatomic,assign) NSObject<EventTypeDelegate> *delegate;

@end
