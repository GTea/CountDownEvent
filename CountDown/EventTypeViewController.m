//
//  EventTypeViewController.m
//  CountDown
//
//  Created by Aaron on 14-2-3.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import "EventTypeViewController.h"

@interface EventTypeViewController ()

@end

@implementation EventTypeViewController

@synthesize typeArray;
@synthesize eventTypeTableView;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSDictionary *eventType1=[[NSDictionary alloc] initWithObjectsAndKeys:@"生活",@"type",@"suggest.png",@"typeIcon", nil];
    NSDictionary *eventType2=[[NSDictionary alloc] initWithObjectsAndKeys:@"工作",@"type",@"setting.png",@"typeIcon", nil];
    NSDictionary *eventType3=[[NSDictionary alloc] initWithObjectsAndKeys:@"生日",@"type",@"user.png",@"typeIcon", nil];
    self.typeArray = [NSArray arrayWithObjects:eventType1, eventType2, eventType3, nil];
    
     NSLog(@"%@",typeArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return typeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TypeCell";
    UITableViewCell *cell = [eventTypeTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSLog(@"CELL -> %@",eventTypeTableView);
    
    // Configure the cell...
    NSDictionary *dic = [typeArray objectAtIndex:[indexPath row]];
    NSLog(@"%d",[indexPath row]);
    ((UILabel *)[cell.contentView viewWithTag:typeTag]).text = [dic objectForKey:@"type"];
    UIImageView *typeImage =  ((UIImageView *)[cell.contentView viewWithTag:typeIconTag]) ;
    [typeImage setImage:[UIImage imageNamed:[dic objectForKey:@"typeIcon"]]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath:%d",[indexPath row]);
    
    NSDictionary *dic = [typeArray objectAtIndex:[indexPath row]];
    NSString *eventTypeText = [dic objectForKey:@"type"];
    NSLog(@"eventType:%@",eventTypeText);
    //通过委托协议传值
    [self.delegate eventType:eventTypeText];
    //退回到第一个窗口
    [self.navigationController popViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
