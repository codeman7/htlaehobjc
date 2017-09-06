//
//  HMoveCounterViewController.h
//  Move
//
//  Created by Cody Weaver on 9/17/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMoveHomeViewController.h"

@interface HMoveCounterViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *skipRestButton;
@property (strong, nonatomic) IBOutlet UIButton *addFifteenButton;
@property (strong, nonatomic) IBOutlet UILabel *secondCounter;
@property (strong, nonatomic) IBOutlet UILabel *nextSetHeader;
@property (strong, nonatomic) IBOutlet UILabel *nextSetExercise;
@property (strong, nonatomic) IBOutlet UILabel *nextSetReps;
@property (strong, nonatomic) IBOutlet UILabel *nextSetWeight;

@property (nonatomic) NSString *nextExercise;
@property (nonatomic) int nextWeight;
@property (nonatomic) int nextReps;
@property (nonatomic) int seconds;
@property (nonatomic) int setCount;
@property (nonatomic) NSMutableArray *badSets;
@property (nonatomic) NSMutableArray *goodSets;
@property (nonatomic) NSDictionary *jsonData;
@property (strong, nonatomic) IBOutlet UIView *background;
- (IBAction)addFifteenSeconds:(id)sender;
- (IBAction)skipRest:(id)sender;

@end
