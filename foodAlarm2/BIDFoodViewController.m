//
//  BIDFoodViewController.m
//  foodAlarm2
//
//  Created by Matt Remick on 5/16/13.
//  Copyright (c) 2013 Matt Remick. All rights reserved.
//

#import "BIDFoodViewController.h"

@interface BIDFoodViewController ()

@end

@implementation BIDFoodViewController

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
    // Do any additional setup after loading the view from its nib.
    
    
    self.foods = @[@"Proteins",@"Chicken Breast",@"Turkey Breast",@"Lean Ground Turkey Breast",@"Swordfish",@"Orange Roughy",@"Salmon",@"Tuna",@"Ahi Tuna",@"Cottage Cheese",@"Top Round Steak",@"Top Sirloin Steak",@"Extra Lean Ground Beef",@"Tri-Tip Steak",@"Egg Whites or Egg Substitutes",@"Carbohydrates",@"Any Fruit",@"Yams",@"Sweet Potato",@"Red Potato",@"Brown Rice",@"Wild Rice",@"Oatmeal",@"Barkley",@"Beans (Kidney, Black, Pinto)",@"Fat Free Yogurt",@"Cream of Wheat",@"Squash",@"Whole Wheat Bread",@"Vegetables",@"Broccoli",@"Asparagus",@"Romaine Lettuce",@"Green Beans",@"Cauliflower",@"Spinach",@"Green Peppers",@"Green Peas",@"Zucchini",@"Cucumber",@"Brussel Sprouts",@"Artichoke",@"Cabbage"
    ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.foods count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 15 || indexPath.row == 29) {
        [cell setBackgroundColor:[UIColor blueColor]];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    else {
        [cell setBackgroundColor:[UIColor clearColor]];
        cell.textLabel.textColor = [UIColor blackColor]; 
    }
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    cell.textLabel.text = self.foods[indexPath.row];
    
    
    return cell;
}

@end
