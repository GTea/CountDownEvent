//
//  EventDetailViewController.h
//  CountDown
//
//  Created by Aaron on 14-2-1.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountDownEvent.h"

@interface EventDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationItem *titleNavItem;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) NSString *eventTitle, *eventId;

@end
