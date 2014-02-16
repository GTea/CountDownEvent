//
//  CountDownViewController.m
//  CountDown
//
//  Created by Aaron on 14-1-26.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import "CountDownViewController.h"

@interface CountDownViewController ()

@end

@implementation CountDownViewController

@synthesize titleNavItem = _titleNavItem;
@synthesize eventArray = _eventArray;
@synthesize tableView = _tableView;

- (void)viewWillAppear:(BOOL)animated
{
    //初始化事件数据
    CountDownEvent *cdEvent = [CountDownEvent alloc];
    _eventArray = [cdEvent getAllCurrentEvent];
    [_tableView reloadData];
    
    [super viewWillAppear:animated];
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;

    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:15.0/255.0 green:126.0/255.0 blue:245.0/255.0 alpha:1.0f],NSForegroundColorAttributeName, nil];
    
    //添加下边框
    CALayer *bottomBorder = [CALayer layer];
    float height=self.navigationController.navigationBar.frame.size.height-1.0f;
    float width=self.navigationController.navigationBar.frame.size.width;
    bottomBorder.frame = CGRectMake(0.0f, height, width, 1.0f);
    bottomBorder.backgroundColor = [UIColor colorWithRed:15.0/255.0 green:126.0/255.0 blue:245.0/255.0 alpha:1.0f].CGColor;
    [self.navigationController.navigationBar.layer addSublayer:bottomBorder];
        
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[LeftMenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[LeftMenuViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    [self.navigationController setToolbarHidden:YES animated:YES];
    
    [cdEvent release];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
        
    
    //初始化事件数据
    CountDownEvent *cdEvent = [CountDownEvent alloc];
    
    _eventArray = [cdEvent getAllCurrentEvent];
    
    [cdEvent release];
    
    NSLog(@"test enter dic");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)addNewEvent:(id)sender
{
    AddNewEventViewController *addNewEventViewController = [[AddNewEventViewController alloc] init];
    [self.navigationController pushViewController:addNewEventViewController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _eventArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"eventCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *dic = [_eventArray objectAtIndex:[indexPath row]];
    // Configure the cell...
    ((UILabel *)[cell.contentView viewWithTag:titleTag]).text = [dic objectForKey:@"title"];
    ((UILabel *)[cell.contentView viewWithTag:eventDayTag]).text = [dic objectForKey:@"eventDate"];
    ((UILabel *)[cell.contentView viewWithTag:leftDayTag]).text = [dic objectForKey:@"leftDate"];
    ((UILabel *)[cell.contentView viewWithTag:eventIdTag]).text = [dic objectForKey:@"id"];

    UIImageView *typeImage =   ((UIImageView *)[cell.contentView viewWithTag:imageTag]) ;
    [typeImage setImage:[UIImage imageNamed:[dic objectForKey:@"typeImage"]]];
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventDetailViewController *eventDetailCtrller = [self.storyboard instantiateViewControllerWithIdentifier:@"eventDetail"];
    
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    NSString *eventId = ((UILabel *)[cell.contentView viewWithTag:eventIdTag]).text;
    NSLog(eventId);
    eventDetailCtrller.eventId = eventId;
    
    [self.navigationController pushViewController:eventDetailCtrller animated:YES];
}

@end
