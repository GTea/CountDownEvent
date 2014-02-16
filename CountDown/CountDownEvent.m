//
//  CountDownEvent.m
//  CountDown
//
//  Created by Aaron on 14-2-2.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import "CountDownEvent.h"

@implementation CountDownEvent

@synthesize eventTitle;

- (BOOL) addEventWithTitle:(NSString *)eventTitle
{
    [self initEventPlist];
    NSString *plistPath = [self getEventPlistPath];
    
    NSMutableDictionary *eventList = [[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath]mutableCopy];
    NSMutableDictionary *events = [eventList objectForKey:@"Events"];
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSMutableDictionary *event = [events objectForKey:uuid];
    event = [[NSMutableDictionary alloc]initWithObjectsAndKeys:uuid,@"id",eventTitle,@"title", nil];;
    [events setValue:event forKey:uuid];
    [eventList setValue:events forKey:@"Events"];
    //写入文件
    [eventList writeToFile:plistPath atomically:YES];
    
    return TRUE;
}

- (NSArray *) getAllCurrentEvent
{
    [self initEventPlist];
    NSString *plistPath = [self getEventPlistPath];
    
    NSMutableDictionary *eventList = [[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath]mutableCopy];
    NSMutableDictionary *events = [eventList objectForKey:@"Events"];
    
    return [events allValues];
}

- (NSMutableDictionary *) getEventWithId:(NSString *) eventId
{
    [self initEventPlist];
    NSString *plistPath = [self getEventPlistPath];
    
    NSMutableDictionary *eventList = [[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath]mutableCopy];
    NSMutableDictionary *events = [eventList objectForKey:@"Events"];
    
    return [events objectForKey:eventId];
}

-(NSString *)getEventPlistPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"event.plist"];
    
    return plistPath;
}

-(void)initEventPlist
{
    NSString *plistPath = [self getEventPlistPath];
    
    //判断是否以创建文件
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        //此处可以自己写显示plist文件内容
        NSLog(@"文件已存在");
    }
    else
    {
        //如果没有plist文件就自动创建
        NSMutableDictionary *dictplist = [[NSMutableDictionary alloc ] init];
        NSMutableDictionary *dicttxt = [[NSMutableDictionary alloc ] init];
        [dictplist setObject:dicttxt forKey:@"Events"];
        //写入文件
        [dictplist writeToFile:plistPath atomically:YES];
    }
}

@end
