//
//  AddNewEventViewController.h
//  CountDown
//
//  Created by Aaron on 14-1-27.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountDownEvent.h"
#import "EventTypeDelegate.h"
#import "EventTypeViewController.h"
#import "IDJDatePickerView.h"

@interface AddNewEventViewController : UITableViewController<EventTypeDelegate,UIActionSheetDelegate>

@property (retain, nonatomic) IBOutlet UITextField *title;
@property (retain, nonatomic) IBOutlet UILabel *eventType;
@property (retain, nonatomic) IBOutlet UILabel *eventRepeat;
@property (retain, nonatomic) IBOutlet UILabel *dateLable;
@property (retain, nonatomic) IBOutlet UISwitch *dateTypeSwitch;

- (IBAction)didEndOnExit:(id)sender ;
- (IBAction)addCDEvent:(id)sender;
- (IBAction)selectEventType:(id)sender;

@end
