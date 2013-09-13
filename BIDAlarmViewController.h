//
//  BIDAlarmViewController.h
//  foodAlarm2
//
//  Created by Matt Remick on 5/16/13.
//  Copyright (c) 2013 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDAlarmViewController : UIViewController 

@property (strong,nonatomic) IBOutlet UIDatePicker *datePicker; 

@property(strong,nonatomic) NSString *hourSelected;
@property(strong,nonatomic) NSString *minuteSelected;
@property(strong,nonatomic) NSString *ampmSelected;
@property (weak,nonatomic) IBOutlet UIButton *setAlarmsButton;
-(IBAction)setReminderUsingDateFromDatePicker: (id)sender;
-(void) scheduleNotificationForDate: (NSDate*)date finalAlarm: (NSDate *)finalAlarmDate;
@property (weak,nonatomic) IBOutlet UIButton *cancelButton;
@property(strong,retain) IBOutlet UILabel *lastMealLabel;
-(IBAction)cancelButtonSelected; 

-(void) viewWillAppear:(BOOL)animated;

@property (strong,nonatomic) IBOutlet UILabel *alarmScheduleLabel; 

@property (strong,nonatomic) IBOutlet UILabel *alarmSet1;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet2;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet3;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet4;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet5;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet6;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet7;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet8;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet9;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet10;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet11;
@property (strong,nonatomic) IBOutlet UILabel *alarmSet12;




@end
