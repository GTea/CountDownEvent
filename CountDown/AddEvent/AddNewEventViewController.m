//
//  AddNewEventViewController.m
//  CountDown
//
//  Created by Aaron on 14-1-27.
//  Copyright (c) 2014年 Aaron. All rights reserved.
//

#import "AddNewEventViewController.h"

@interface AddNewEventViewController ()

@end

@implementation AddNewEventViewController

@synthesize title,eventType,eventRepeat,dateLable,dateTypeSwitch;

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didEndOnExit:(id)sender
{
    // 隐藏键盘.
    [sender resignFirstResponder];
}

- (IBAction)addCDEvent:(id)sender
{
    CountDownEvent *cdEvent = [CountDownEvent alloc];
    [cdEvent addEventWithTitle:title.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)eventType:(NSString *)value
{
    NSLog(@"delege:%@",value);
    eventType.text = value;
}

-(void)eventRepeat:(NSString *)value
{
    NSLog(@"delege:%@",value);
    eventRepeat.text = value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section]==1&&[indexPath row]==0){
        EventTypeViewController *eventTypeView  = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EventTypeViewController"];
        //设置第二个窗口中的delegate为第一个窗口的self
        eventTypeView.delegate = self;
        
        [self.navigationController pushViewController:eventTypeView animated:YES];
        
    }else if ([indexPath section]==1&&[indexPath row]==2){
        NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n" ;
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"关闭", nil];
        [actionSheet showInView:self.view];
        
        self.view.backgroundColor=[UIColor whiteColor];
        //日期选择器
        IDJDatePickerView *djdateGregorianView=[[IDJDatePickerView alloc] initWithFrame:CGRectMake(10, 10, 300, 200) type:Gregorian1];
        if(dateTypeSwitch.isOn){
        djdateGregorianView=[[IDJDatePickerView alloc] initWithFrame:CGRectMake(10, 10, 300, 200) type:Chinese1];
        }
        [self.view addSubview:djdateGregorianView];
        djdateGregorianView.delegate=self;

        [actionSheet addSubview:djdateGregorianView];

    }else if ([indexPath section]==1&&[indexPath row]==3){
        EventTypeViewController *eventTypeView  = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EventRepeatViewController"];
        //设置第二个窗口中的delegate为第一个窗口的self
        eventTypeView.delegate = self;
        
        [self.navigationController pushViewController:eventTypeView animated:YES];
        
    }
    
}


//接收日期选择器选项变化的通知
- (void)notifyNewCalendar:(IDJCalendar *)cal {
    if ([cal isMemberOfClass:[IDJCalendar class]]) {
        NSLog(@"%@:era=%@, year=%@, month=%@, day=%@, weekday=%@", cal, cal.era, cal.year, cal.month, cal.day, cal.weekday);
        NSString *timestamp = [[NSString alloc]init];
        timestamp = [timestamp stringByAppendingFormat:@"%@年%@月%@日",cal.year, cal.month, cal.day];
        NSLog(timestamp);
        [dateLable setText:timestamp];
    } else if ([cal isMemberOfClass:[IDJChineseCalendar class]]) {
        IDJChineseCalendar *_cal=(IDJChineseCalendar *)cal;
        NSLog(@"%@:era=%@, year=%@, month=%@, day=%@, weekday=%@, animal=%@", cal, cal.era, cal.year, cal.month, cal.day, cal.weekday, _cal.animal);
        NSString *chineseMonth=_cal.getChineseMonth;
        NSString *chineseDay=_cal.getChineseDay;
        NSString *timestamp = [[NSString alloc]init];
        timestamp = [timestamp stringByAppendingFormat:@"%@年%@%@",_cal.year, chineseMonth,chineseDay];
        NSLog(timestamp);
        [dateLable setText:timestamp];
    }
}

@end
