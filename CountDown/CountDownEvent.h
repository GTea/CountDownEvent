//
//  CountDownEvent.h
//  CountDown
//
//  Created by Aaron on 14-2-2.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountDownEvent : NSObject

@property (nonatomic, retain) NSString *eventTitle;

- (BOOL) addEventWithTitle:(NSString *)eventTitle;
- (NSMutableDictionary *) getEventWithId:(NSString *) eventId;
- (NSArray *) getAllCurrentEvent;

@end
