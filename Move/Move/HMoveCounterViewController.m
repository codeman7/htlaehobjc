//
//  HMoveCounterViewController.m
//  Move
//
//  Created by Cody Weaver on 9/17/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HMoveCounterViewController.h"

@interface HMoveCounterViewController ()

@end

@implementation HMoveCounterViewController
@synthesize skipRestButton, addFifteenButton, secondCounter, nextSetHeader, nextSetExercise, nextSetReps, nextSetWeight, seconds, background, goodSets, badSets, jsonData, setCount, nextExercise, nextReps, nextWeight;

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
    [self customLoad];
    [secondCounter setText:@""];
    [self countDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)countDown
{
    NSTimer *countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(advancedTimer) userInfo:nil repeats:YES];
    if (seconds > 1) {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addTimer:countDownTimer forMode:NSDefaultRunLoopMode];
    }
   
}

-(void)advancedTimer
{
    seconds-=1;
    if (seconds > 9) {
        
        int minutes = seconds / 60;
        int realSeconds = seconds % 60;
        if (realSeconds > 9) {
            [secondCounter setText:[NSString stringWithFormat:@"%d:%d", minutes, realSeconds]];
        } else {
            [secondCounter setText:[NSString stringWithFormat:@"%d:0%d", minutes, realSeconds]];

        }
        
    } else if (seconds > 0){
        [secondCounter setText:[NSString stringWithFormat:@"0:0%d", seconds]];
        if (seconds % 2 == 1) {
        
            UIColor *yellow = [UIColor colorWithRed:1.0
                                          green:0.92
                                           blue:0.23
                                          alpha:1.0];
            background.backgroundColor = yellow;
            UIImage *yellowButton = [UIImage imageNamed:@"ButtonYellow"];
            [addFifteenButton setBackgroundImage:yellowButton
                                        forState:UIControlStateNormal];
            [skipRestButton setBackgroundImage:yellowButton
                                      forState:UIControlStateNormal];
        } else {
            UIColor *white = [UIColor whiteColor];
            background.backgroundColor = white;
            UIImage *button = [UIImage imageNamed:@"Button"];
            [addFifteenButton setBackgroundImage:button
                                        forState:UIControlStateNormal];
            [skipRestButton setBackgroundImage:button
                                      forState:UIControlStateNormal];
        }
    } else if (seconds <= 0) {
        [secondCounter setText:@"0:00"];
        [skipRestButton setTitle:@"Next Set" forState:UIControlStateNormal];
        UIColor *yellow = [UIColor colorWithRed:1.0
                                          green:0.92
                                           blue:0.23
                                          alpha:1.0];
        background.backgroundColor = yellow;
        UIImage *yellowButton = [UIImage imageNamed:@"ButtonYellow"];
        [addFifteenButton setBackgroundImage:yellowButton
                                    forState:UIControlStateNormal];
        [skipRestButton setBackgroundImage:yellowButton
                                  forState:UIControlStateNormal];
    }
}

-(void)customLoad
{
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular" size:12.0];
    UIFont *robotoSixteen = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    UIFont *light = [UIFont fontWithName:@"Roboto-Light" size:48.0];
    skipRestButton.titleLabel.font = standard;
    addFifteenButton.titleLabel.font = standard;
    nextSetHeader.font = robotoSixteen;
    secondCounter.font = light;
    UIColor *blue = [UIColor colorWithRed:0.01 green:0.66 blue:0.96 alpha:1.0];
    secondCounter.textColor = blue;
    //set text for the next set and style it
    [nextSetExercise setText:nextExercise];
    nextSetExercise.font = robotoSixteen;
    
    //set text for the next set reps and style it
    [nextSetReps setText:[NSString stringWithFormat:@"%d", nextReps]];
    nextSetReps.font = robotoSixteen;
    
    //set text for the next set weight and style it
    [nextSetWeight setText:[NSString stringWithFormat:@"%d", nextWeight]];
    nextSetWeight.font = robotoSixteen;
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"restToWorkout"]) {
        
        HMoveHomeViewController *viewController = [segue destinationViewController];
        [viewController setGoodSets:goodSets];
        [viewController setBadSets:badSets];
        [viewController setJsonData:jsonData];
        [viewController setSetCount:setCount];
    }
}


- (IBAction)addFifteenSeconds:(id)sender {
    seconds += 15;
}

- (IBAction)skipRest:(id)sender {
    [self performSegueWithIdentifier:@"restToWorkout" sender:self];
}
@end
