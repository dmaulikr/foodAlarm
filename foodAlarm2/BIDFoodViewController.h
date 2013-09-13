//
//  BIDFoodViewController.h
//  foodAlarm2
//
//  Created by Matt Remick on 5/16/13.
//  Copyright (c) 2013 Matt Remick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDFoodViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>

@property (copy,nonatomic) NSArray *foods;
@property (assign, nonatomic) NSUInteger selectedFood; 

@end
