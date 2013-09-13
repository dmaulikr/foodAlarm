//
//  BIDAlarmViewController.m
//  foodAlarm2
//
//  Created by Matt Remick on 5/16/13.
//  Copyright (c) 2013 Matt Remick. All rights reserved.
//

//Add timer
//add cancel button in timer view
//add sounds
//add custom button
//change header

#import "BIDAlarmViewController.h"

@interface BIDAlarmViewController () 

@end

@implementation BIDAlarmViewController {
    int numberOfAlarms;
     
}

@synthesize datePicker;
@synthesize setAlarmsButton;
@synthesize cancelButton;
@synthesize lastMealLabel;
@synthesize alarmScheduleLabel;
@synthesize alarmSet1;
@synthesize alarmSet2;
@synthesize alarmSet3;
@synthesize alarmSet4;
@synthesize alarmSet5;
@synthesize alarmSet6;
@synthesize alarmSet7;
@synthesize alarmSet8;
@synthesize alarmSet9;
@synthesize alarmSet10;
@synthesize alarmSet11;
@synthesize alarmSet12;


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
    // Do any additional setup after loading the view from its nib
    
    numberOfAlarms = 0;
    
    //skinning the UIButtons 
    UIImage *startButtonImage = [UIImage imageNamed:@"greenButtonHighlight.png"];
    UIImage *cancelButtonImage = [UIImage imageNamed:@"orangeButtonHighlight.png"]; 
    
    UIEdgeInsets insets = UIEdgeInsetsMake(10.0f, 30.0f, 10.0f, 30.0f);
    
    startButtonImage = [startButtonImage resizableImageWithCapInsets:insets];
    cancelButtonImage = [cancelButtonImage resizableImageWithCapInsets:insets];
    
    [self.setAlarmsButton setBackgroundImage:startButtonImage forState:UIControlStateNormal];
    [self.cancelButton setBackgroundImage:cancelButtonImage forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)setReminderUsingDateFromDatePicker: (id)sender{
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDate *pickerDate = [self.datePicker date];
    
    NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit )
                                                   fromDate:pickerDate];
    NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
                                                   fromDate:pickerDate]; 
    
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    
    [dateComps setDay:[dateComponents day]];
    [dateComps setMonth:[dateComponents month]];
    [dateComps setYear:[dateComponents year]];
    [dateComps setHour:[timeComponents hour]];
    [dateComps setMinute:[timeComponents minute]];
    [dateComps setSecond:0];
    
    //date chosen from the picker with seconds = 0 i.e., final alarm
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    
    //creating a NSDateFormatter for readability
    NSDateFormatter *yearMonthDay = [[NSDateFormatter alloc]init];
    [yearMonthDay setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
    
    //isolate current date/hour/minute
    NSDate *currentDate = [NSDate date];
    
    //Comparison of current date and final date 
    NSComparisonResult dayOfAlarm = [itemDate compare:currentDate];
    
    //deciding if item date should be today or tomorrow 
    if (dayOfAlarm == NSOrderedAscending) {
        NSDate *itemDateNextDay = [itemDate dateByAddingTimeInterval:86400];
        itemDate = itemDateNextDay;
    }
    
    //creating a date from the components
    NSDate *firstAlarmDate = [currentDate dateByAddingTimeInterval:7200];
    
//setting the first alarm
    [self scheduleNotificationForDate: firstAlarmDate finalAlarm:itemDate];

//second alarm     
    
    //creating a date from the components
    NSDate *secondAlarmDate = [firstAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: secondAlarmDate finalAlarm:itemDate];
    
//third alarm
    
    //creating a date from the components
    NSDate *thirdAlarmDate = [secondAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: thirdAlarmDate finalAlarm:itemDate];
    
//fourth alarm 
    
    //creating a date from the components
    NSDate *fourthAlarmDate = [thirdAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: fourthAlarmDate finalAlarm:itemDate];
    
//fifth alarm 
    
    //creating a date from the components
    NSDate *fifthAlarmDate = [fourthAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: fifthAlarmDate finalAlarm:itemDate];
    
//sixth alarm 
    
    //creating a date from the components
    NSDate *sixthAlarmDate = [fifthAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: sixthAlarmDate finalAlarm:itemDate];
    
//seventh alarm
    
    //creating a date from the components
    NSDate *seventhAlarmDate = [sixthAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: seventhAlarmDate finalAlarm:itemDate];
    
//eight alarm 
    
    //creating a date from the components
    NSDate *eighthAlarmDate = [seventhAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: eighthAlarmDate finalAlarm:itemDate];
    
//ninth alarm
    
    //creating a date from the components
    NSDate *ninthAlarmDate = [eighthAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: ninthAlarmDate finalAlarm:itemDate];

//tenth alarm
    
    //creating a date from the components
    NSDate *tenthAlarmDate = [ninthAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: tenthAlarmDate finalAlarm:itemDate];
    
//eleventh alarm
    
    //creating a date from the components
    NSDate *eleventhAlarmDate = [tenthAlarmDate dateByAddingTimeInterval:7200];
    
    //setting the first alarm
    [self scheduleNotificationForDate: eleventhAlarmDate finalAlarm:itemDate];
    
//final alarm
    
    [self scheduleNotificationForDate:itemDate finalAlarm:itemDate]; 
    
    
//final alarm
    
   /* UILocalNotification *finalAlarm = [[UILocalNotification alloc] init];
    if (finalAlarm) {
        finalAlarm.fireDate = itemDate;
        finalAlarm.timeZone = [NSTimeZone defaultTimeZone];
        finalAlarm.repeatInterval = 0;
        finalAlarm.soundName = UILocalNotificationDefaultSoundName;
        finalAlarm.alertBody = @"Time to Eat!";
        [[UIApplication sharedApplication] scheduleLocalNotification:finalAlarm];
        
        //creating a NSDateFormatter for readability
        NSDateFormatter *yearMonthDay = [[NSDateFormatter alloc]init];
        [yearMonthDay setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
        
        NSString * dateString = [yearMonthDay stringFromDate:itemDate];
        NSLog(@"Alarm set.. Time/Date: %@",dateString);
        
    }
    
    */ 
    
    
    
    NSString *messagString = [NSString stringWithFormat:@"%d alarms have been set!",numberOfAlarms]; 
    
    //alert to let the user know the alarm has been set
    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"Alarms activated"
                                                     message:messagString
                                                    delegate:self cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    
    [alert show];

    cancelButton.hidden = NO; 
        
    datePicker.hidden = YES;
    setAlarmsButton.hidden = YES;
    lastMealLabel.hidden = YES;
    
    NSDateFormatter *scheduleFormatter = [[NSDateFormatter alloc]init];
    [scheduleFormatter setDateFormat:@"HH:mm a"];
    
    
    if (numberOfAlarms == 1) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #1: %@",finalAlarmTimeFormatted];
        self.alarmSet1.text = finalAlarmString; 
    }
    
    if (numberOfAlarms == 2) {
        alarmScheduleLabel.hidden = NO; 
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #2: %@",finalAlarmTimeFormatted];
        self.alarmSet2.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 3) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2: %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #3: %@",finalAlarmTimeFormatted];
        self.alarmSet3.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 4) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2: %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3: %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #4: %@",finalAlarmTimeFormatted];
        self.alarmSet4.text = finalAlarmString;
        
    }
    
    if (numberOfAlarms == 5) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2: %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3: %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4: %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #5: %@",finalAlarmTimeFormatted];
        self.alarmSet5.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 6) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO;
        alarmSet6.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2: %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3: %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4: %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *fifthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fifthAlarmDate];
        NSString *alarm5String = [NSString stringWithFormat:@"Alarm #5: %@",fifthAlarmTimeFormatted];
        self.alarmSet5.text = alarm5String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #6: %@",finalAlarmTimeFormatted];
        self.alarmSet6.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 7) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO;
        alarmSet6.hidden = NO;
        alarmSet7.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2: %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3: %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4: %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *fifthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fifthAlarmDate];
        NSString *alarm5String = [NSString stringWithFormat:@"Alarm #5: %@",fifthAlarmTimeFormatted];
        self.alarmSet5.text = alarm5String;
        
        NSString *sixthAlarmTimeFormatted = [scheduleFormatter stringFromDate:sixthAlarmDate];
        NSString *alarm6String = [NSString stringWithFormat:@"Alarm #6: %@",sixthAlarmTimeFormatted];
        self.alarmSet6.text = alarm6String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #7: %@",finalAlarmTimeFormatted];
        self.alarmSet7.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 8) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO;
        alarmSet6.hidden = NO;
        alarmSet7.hidden = NO;
        alarmSet8.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2: %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3: %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4: %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *fifthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fifthAlarmDate];
        NSString *alarm5String = [NSString stringWithFormat:@"Alarm #5: %@",fifthAlarmTimeFormatted];
        self.alarmSet5.text = alarm5String;
        
        NSString *sixthAlarmTimeFormatted = [scheduleFormatter stringFromDate:sixthAlarmDate];
        NSString *alarm6String = [NSString stringWithFormat:@"Alarm #6: %@",sixthAlarmTimeFormatted];
        self.alarmSet6.text = alarm6String;
        
        NSString *seventhAlarmTimeFormatted = [scheduleFormatter stringFromDate:seventhAlarmDate];
        NSString *alarm7String = [NSString stringWithFormat:@"Alarm #7: %@",seventhAlarmTimeFormatted];
        self.alarmSet7.text = alarm7String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #8: %@",finalAlarmTimeFormatted];
        self.alarmSet8.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 9) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO;
        alarmSet6.hidden = NO;
        alarmSet7.hidden = NO;
        alarmSet8.hidden = NO;
        alarmSet9.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1: %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2: %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3: %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4: %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *fifthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fifthAlarmDate];
        NSString *alarm5String = [NSString stringWithFormat:@"Alarm #5: %@",fifthAlarmTimeFormatted];
        self.alarmSet5.text = alarm5String;
        
        NSString *sixthAlarmTimeFormatted = [scheduleFormatter stringFromDate:sixthAlarmDate];
        NSString *alarm6String = [NSString stringWithFormat:@"Alarm #6: %@",sixthAlarmTimeFormatted];
        self.alarmSet6.text = alarm6String;
        
        NSString *seventhAlarmTimeFormatted = [scheduleFormatter stringFromDate:seventhAlarmDate];
        NSString *alarm7String = [NSString stringWithFormat:@"Alarm #7: %@",seventhAlarmTimeFormatted];
        self.alarmSet7.text = alarm7String;
        
        NSString *eighthAlarmTimeFormatted = [scheduleFormatter stringFromDate:eighthAlarmDate];
        NSString *alarm8String = [NSString stringWithFormat:@"Alarm #8: %@",eighthAlarmTimeFormatted];
        self.alarmSet8.text = alarm8String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #9: %@",finalAlarmTimeFormatted];
        self.alarmSet9.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 10) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO;
        alarmSet6.hidden = NO;
        alarmSet7.hidden = NO;
        alarmSet8.hidden = NO;
        alarmSet9.hidden = NO;
        alarmSet10.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1:  %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2:  %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3:  %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4:  %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *fifthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fifthAlarmDate];
        NSString *alarm5String = [NSString stringWithFormat:@"Alarm #5:  %@",fifthAlarmTimeFormatted];
        self.alarmSet5.text = alarm5String;
        
        NSString *sixthAlarmTimeFormatted = [scheduleFormatter stringFromDate:sixthAlarmDate];
        NSString *alarm6String = [NSString stringWithFormat:@"Alarm #6:  %@",sixthAlarmTimeFormatted];
        self.alarmSet6.text = alarm6String;
        
        NSString *seventhAlarmTimeFormatted = [scheduleFormatter stringFromDate:seventhAlarmDate];
        NSString *alarm7String = [NSString stringWithFormat:@"Alarm #7:  %@",seventhAlarmTimeFormatted];
        self.alarmSet7.text = alarm7String;
        
        NSString *eighthAlarmTimeFormatted = [scheduleFormatter stringFromDate:eighthAlarmDate];
        NSString *alarm8String = [NSString stringWithFormat:@"Alarm #8:  %@",eighthAlarmTimeFormatted];
        self.alarmSet8.text = alarm8String;
        
        NSString *ninthAlarmTimeFormatted = [scheduleFormatter stringFromDate:ninthAlarmDate];
        NSString *alarm9String = [NSString stringWithFormat:@"Alarm #9:  %@",ninthAlarmTimeFormatted];
        self.alarmSet9.text = alarm9String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #10: %@",finalAlarmTimeFormatted];
        self.alarmSet10.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 11) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO;
        alarmSet6.hidden = NO;
        alarmSet7.hidden = NO;
        alarmSet8.hidden = NO;
        alarmSet9.hidden = NO;
        alarmSet10.hidden = NO;
        alarmSet11.hidden = NO;
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1:  %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2:  %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3:  %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4:  %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *fifthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fifthAlarmDate];
        NSString *alarm5String = [NSString stringWithFormat:@"Alarm #5:  %@",fifthAlarmTimeFormatted];
        self.alarmSet5.text = alarm5String;
        
        NSString *sixthAlarmTimeFormatted = [scheduleFormatter stringFromDate:sixthAlarmDate];
        NSString *alarm6String = [NSString stringWithFormat:@"Alarm #6:  %@",sixthAlarmTimeFormatted];
        self.alarmSet6.text = alarm6String;
        
        NSString *seventhAlarmTimeFormatted = [scheduleFormatter stringFromDate:seventhAlarmDate];
        NSString *alarm7String = [NSString stringWithFormat:@"Alarm #7:  %@",seventhAlarmTimeFormatted];
        self.alarmSet7.text = alarm7String;
        
        NSString *eighthAlarmTimeFormatted = [scheduleFormatter stringFromDate:eighthAlarmDate];
        NSString *alarm8String = [NSString stringWithFormat:@"Alarm #8:  %@",eighthAlarmTimeFormatted];
        self.alarmSet8.text = alarm8String;
        
        NSString *ninthAlarmTimeFormatted = [scheduleFormatter stringFromDate:ninthAlarmDate];
        NSString *alarm9String = [NSString stringWithFormat:@"Alarm #9:  %@",ninthAlarmTimeFormatted];
        self.alarmSet9.text = alarm9String;
        
        NSString *tenthAlarmTimeFormatted = [scheduleFormatter stringFromDate:tenthAlarmDate];
        NSString *alarm10String = [NSString stringWithFormat:@"Alarm #10: %@",tenthAlarmTimeFormatted];
        self.alarmSet10.text = alarm10String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #11: %@",finalAlarmTimeFormatted];
        self.alarmSet11.text = finalAlarmString;
    }
    
    if (numberOfAlarms == 12) {
        alarmScheduleLabel.hidden = NO;
        alarmSet1.hidden = NO;
        alarmSet2.hidden = NO;
        alarmSet3.hidden = NO;
        alarmSet4.hidden = NO;
        alarmSet5.hidden = NO;
        alarmSet6.hidden = NO;
        alarmSet7.hidden = NO;
        alarmSet8.hidden = NO;
        alarmSet9.hidden = NO;
        alarmSet10.hidden = NO;
        alarmSet11.hidden = NO;
        alarmSet12.hidden = NO; 
        
        NSString *firstAlarmTimeFormatted = [scheduleFormatter stringFromDate:firstAlarmDate];
        NSString *alarm1String = [NSString stringWithFormat:@"Alarm #1:  %@",firstAlarmTimeFormatted];
        self.alarmSet1.text = alarm1String;
        
        NSString *secondAlarmFormatted = [scheduleFormatter stringFromDate:secondAlarmDate];
        NSString *alarm2String = [NSString stringWithFormat:@"Alarm #2:  %@",secondAlarmFormatted];
        self.alarmSet2.text = alarm2String;
        
        NSString *thirdAlarmTimeFormatted = [scheduleFormatter stringFromDate:thirdAlarmDate];
        NSString *alarm3String = [NSString stringWithFormat:@"Alarm #3:  %@",thirdAlarmTimeFormatted];
        self.alarmSet3.text = alarm3String;
        
        NSString *fourthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fourthAlarmDate];
        NSString *alarm4String = [NSString stringWithFormat:@"Alarm #4:  %@",fourthAlarmTimeFormatted];
        self.alarmSet4.text = alarm4String;
        
        NSString *fifthAlarmTimeFormatted = [scheduleFormatter stringFromDate:fifthAlarmDate];
        NSString *alarm5String = [NSString stringWithFormat:@"Alarm #5:  %@",fifthAlarmTimeFormatted];
        self.alarmSet5.text = alarm5String;
        
        NSString *sixthAlarmTimeFormatted = [scheduleFormatter stringFromDate:sixthAlarmDate];
        NSString *alarm6String = [NSString stringWithFormat:@"Alarm #6:  %@",sixthAlarmTimeFormatted];
        self.alarmSet6.text = alarm6String;
        
        NSString *seventhAlarmTimeFormatted = [scheduleFormatter stringFromDate:seventhAlarmDate];
        NSString *alarm7String = [NSString stringWithFormat:@"Alarm #7:  %@",seventhAlarmTimeFormatted];
        self.alarmSet7.text = alarm7String;
        
        NSString *eighthAlarmTimeFormatted = [scheduleFormatter stringFromDate:eighthAlarmDate];
        NSString *alarm8String = [NSString stringWithFormat:@"Alarm #8:  %@",eighthAlarmTimeFormatted];
        self.alarmSet8.text = alarm8String;
        
        NSString *ninthAlarmTimeFormatted = [scheduleFormatter stringFromDate:ninthAlarmDate];
        NSString *alarm9String = [NSString stringWithFormat:@"Alarm #9:  %@",ninthAlarmTimeFormatted];
        self.alarmSet9.text = alarm9String;
        
        NSString *tenthAlarmTimeFormatted = [scheduleFormatter stringFromDate:tenthAlarmDate];
        NSString *alarm10String = [NSString stringWithFormat:@"Alarm #10:  %@",tenthAlarmTimeFormatted];
        self.alarmSet10.text = alarm10String;
        
        NSString *eleventhAlarmTimeFormatted = [scheduleFormatter stringFromDate:eleventhAlarmDate];
        NSString *alarm11String = [NSString stringWithFormat:@"Alarm #11:  %@",eleventhAlarmTimeFormatted];
        self.alarmSet11.text = alarm11String;
        
        NSString *finalAlarmTimeFormatted = [scheduleFormatter stringFromDate:itemDate];
        NSString *finalAlarmString = [NSString stringWithFormat:@"Alarm #12:  %@",finalAlarmTimeFormatted];
        self.alarmSet12.text = finalAlarmString;
    }

}


-(IBAction)cancelButtonSelected{
    
    //Canceling all UILocalNotifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    //Making the proper UI features hidden and not hidden
    
    cancelButton.hidden = YES;
        
    datePicker.hidden = NO;
    setAlarmsButton.hidden = NO;
    lastMealLabel.hidden = NO;
    
    alarmScheduleLabel.hidden = YES;
    alarmSet1.hidden = YES;
    alarmSet2.hidden = YES;
    alarmSet3.hidden = YES;
    alarmSet4.hidden = YES;
    alarmSet5.hidden = YES;
    alarmSet6.hidden = YES;
    alarmSet7.hidden = YES;
    alarmSet8.hidden = YES;
    alarmSet9.hidden = YES;
    alarmSet10.hidden = YES;
    alarmSet11.hidden = YES;
    alarmSet12.hidden = YES;
    
    numberOfAlarms = 0;
    
    
}

-(void) scheduleNotificationForDate: (NSDate*)date finalAlarm: (NSDate *)finalAlarmDate {

    
    NSComparisonResult result = [finalAlarmDate compare:date];
    
    if (result == NSOrderedDescending || result == NSOrderedSame) {
        UILocalNotification *alarm = [[UILocalNotification alloc] init];
        if (alarm) {
            
            alarm.fireDate = date;
            alarm.timeZone = [NSTimeZone defaultTimeZone];
            alarm.repeatInterval = 0;
            alarm.soundName = UILocalNotificationDefaultSoundName;
            alarm.alertBody = @"Time to Eat!";
            [[UIApplication sharedApplication] scheduleLocalNotification:alarm];
            
            //creating a NSDateFormatter for readability
            NSDateFormatter *yearMonthDay = [[NSDateFormatter alloc]init];
            [yearMonthDay setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
            
            //priting dates and times of scheduled alarms
            NSString * dateString = [yearMonthDay stringFromDate:date];
            NSLog(@"Alarm set.. Time/Date: %@",dateString);
            
            ++numberOfAlarms; 
            
            
            
        }
    }
    
}

@end
