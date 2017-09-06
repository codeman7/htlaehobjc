//
//  HMoveEditViewController.h
//  Htlaeh
//
//  Created by Cody Weaver on 10/13/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMoveHomeViewController.h"
#import "HMoveEditPreviewViewController.h"

@interface HMoveEditViewController : UIViewController
@property (strong, nonatomic) NSMutableDictionary *workoutData;
@property (nonatomic) int currentSetCount;
@property (strong, nonatomic) IBOutlet UITextField *exerciseName;
@property (strong, nonatomic) IBOutlet UILabel *exerciseNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *repsNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *repsAmount;
@property (strong, nonatomic) IBOutlet UILabel *weightNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *weightAmount;
@property (strong, nonatomic) IBOutlet UILabel *restMinutesLabel;
@property (strong, nonatomic) IBOutlet UITextField *restMinutesField;
@property (strong, nonatomic) IBOutlet UILabel *restSecondsLabel;
@property (strong, nonatomic) IBOutlet UIButton *addSetButton;
@property (strong, nonatomic) IBOutlet UIButton *addWorkout;
@property (strong, nonatomic) IBOutlet UITextField *restSecondsField;
@property (strong, nonatomic) IBOutlet UIView *labelView;
@property (strong, nonatomic) IBOutlet UIView *statusView;
@property (strong, nonatomic) IBOutlet UILabel *pageTitle;
@property (strong, nonatomic) IBOutlet UIView *navView;
@property (strong, nonatomic) IBOutlet UILabel *navLabel;
@property (strong, nonatomic) IBOutlet UIButton *homeNavButton;
@property (strong, nonatomic) IBOutlet UIButton *closeNavButton;
@property (strong, nonatomic) IBOutlet UIButton *signOutButton;
@property (strong, nonatomic) IBOutlet UIButton *calenderNavButton;
@property (strong, nonatomic) NSMutableDictionary *theNewWorkoutData;
- (IBAction)exerciseNameBegin:(id)sender;
- (IBAction)exerciseNameEnd:(id)sender;
- (IBAction)repsAmountBegin:(id)sender;
- (IBAction)repsAmountEnd:(id)sender;
- (IBAction)weightAmountBegin:(id)sender;
- (IBAction)weightAmountEnd:(id)sender;
- (IBAction)restMinutesBegin:(id)sender;
- (IBAction)restMinutesEnd:(id)sender;
- (IBAction)restSecondsBegin:(id)sender;
- (IBAction)restSecondsEnd:(id)sender;
- (IBAction)navSidebar:(id)sender;
- (IBAction)workoutPreview:(id)sender;
- (IBAction)segueHome:(id)sender;
- (IBAction)addSetAction:(id)sender;

@end
