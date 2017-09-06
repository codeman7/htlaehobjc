//
//  HMoveEditPreviewViewController.m
//  Htlaeh
//
//  Created by Cody Weaver on 12/27/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HMoveEditPreviewViewController.h"

@interface HMoveEditPreviewViewController ()

@end

@implementation HMoveEditPreviewViewController

@synthesize titleView, statusView, backButton, pageLabel, tableView, workoutData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customLoad];
    
    //set tableview delegate and datasource as itself
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customLoad
{
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    
    UIColor *darkBlue = [UIColor colorWithRed:0.01
                                        green:0.61
                                         blue:0.90
                                        alpha:1.0];
    
    UIColor *white = [UIColor colorWithRed:1.0
                                     green:1.0
                                      blue:1.0
                                     alpha:1.0];
    
    statusView.backgroundColor = darkBlue;
    titleView.backgroundColor = blue;
    titleView.layer.masksToBounds = NO;
    titleView.layer.shadowColor = [UIColor blackColor].CGColor;
    titleView.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    titleView.layer.shadowOpacity = 0.24;
    titleView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    titleView.layer.shouldRasterize = YES;
    
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    pageLabel.font = standard;
    pageLabel.textColor = white;
    
    UIImage *backImage = [UIImage imageNamed:@"backButtonImage"];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
   
    
}

#pragma mark - Table Stuff

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //count how many items in the data dictionary
    return workoutData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //custom UI stuff for the table
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    self.tableView.separatorColor = [UIColor clearColor];
    //doesn't allow row to become grey on click
    
    long indexPlusOne = (indexPath.row) + 1;
    NSString *indexCountString = [@(indexPlusOne) stringValue];
    
    UIFont *regular = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    UIFont *small = [UIFont fontWithName:@"Roboto-Regular" size:12.0];
    UILabel *exerciseHeader = (UILabel *)[cell viewWithTag:1];
    exerciseHeader.font = small;
    UILabel *exercise = (UILabel *)[cell viewWithTag:2];
    exercise.font = regular;
    NSMutableString *exerciseKey = [NSMutableString stringWithFormat:@"Set%@.Exercise", indexCountString];
    exercise.text = [workoutData  valueForKeyPath:exerciseKey];
    UILabel *repsHeader = (UILabel *)[cell viewWithTag:3];
    repsHeader.font = small;
    UILabel *reps = (UILabel *)[cell viewWithTag:4];
    reps.font = regular;
    NSMutableString *repsKey = [NSMutableString stringWithFormat:@"Set%@.Reps", indexCountString];
    reps.text = [workoutData valueForKeyPath:repsKey];
    UILabel *weightHeader = (UILabel *)[cell viewWithTag:5];
    weightHeader.font = small;
    UILabel *weight = (UILabel *)[cell viewWithTag:6];
    weight.font = regular;
    NSMutableString *weightKey = [NSMutableString stringWithFormat:@"Set%@.Weight", indexCountString];
    weight.text = [workoutData valueForKeyPath:weightKey];
    UILabel *restHeader = (UILabel *)[cell viewWithTag:7];
    restHeader.font = small;
    UILabel *restTime = (UILabel *)[cell viewWithTag:8];
    restTime.font = regular;
    NSMutableString *restMinutesKey = [NSMutableString stringWithFormat:@"Set%@.RestMinutes", indexCountString];
    NSMutableString *restSecondsKey = [NSMutableString stringWithFormat:@"Set%@.RestSeconds", indexCountString];
    NSMutableString *restSeconds = [workoutData valueForKeyPath:restSecondsKey];
    if (restSeconds.length < 2) {
        restSeconds = [NSMutableString stringWithFormat:@"0%@", restSeconds];
    }
    NSString *restTimeString = [NSString stringWithFormat:@"%@:%@", [workoutData valueForKeyPath:restMinutesKey], restSeconds];
    NSLog(@"%@", restTimeString);
    restTime.text = restTimeString;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"leaveEditPreview"]) {
        HMoveEditViewController *viewController = [segue destinationViewController];
        [viewController setTheNewWorkoutData:workoutData];
    }
}


- (IBAction)backAction:(id)sender {
    [self performSegueWithIdentifier:@"leaveEditPreview" sender:self];
}
@end
