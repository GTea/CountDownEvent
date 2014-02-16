//
//  EventTypeDelegate.h
//  CountDown
//
//  Created by Aaron on 14-2-3.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol EventTypeDelegate <NSObject>

-(void)eventType:(NSString *)value;
-(void)eventRepeat:(NSString *)value;

@end
