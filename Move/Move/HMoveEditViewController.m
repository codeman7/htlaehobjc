//
//  HMoveEditViewController.m
//  Htlaeh
//
//  Created by Cody Weaver on 10/13/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HMoveEditViewController.h"

@interface HMoveEditViewController ()


@end

@implementation HMoveEditViewController

@synthesize exerciseName, exerciseNameLabel, repsAmount, repsNameLabel, weightAmount, weightNameLabel, restMinutesField, restMinutesLabel, restSecondsField, restSecondsLabel, addSetButton, addWorkout, labelView, statusView, pageTitle, workoutData, navView, homeNavButton, closeNavButton, signOutButton, calenderNavButton, navLabel, theNewWorkoutData, currentSetCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customLoading];
    currentSetCount = 0;
    if ([theNewWorkoutData count] == 0) {
        theNewWorkoutData = [[NSMutableDictionary alloc] init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customLoading
{
    UIFont *large = [UIFont fontWithName:@"Roboto-Regular"
                                    size:16];
    labelView.layer.masksToBounds = NO;
    labelView.layer.shadowColor = [UIColor blackColor].CGColor;
    labelView.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    labelView.layer.shadowOpacity = 0.24;
    labelView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    labelView.layer.shouldRasterize = YES;
    
    
    [exerciseName setBorderStyle:UITextBorderStyleNone];
    [repsAmount setBorderStyle:UITextBorderStyleNone];
    [weightAmount setBorderStyle:UITextBorderStyleNone];
    [restMinutesField setBorderStyle:UITextBorderStyleNone];
    [restSecondsField setBorderStyle:UITextBorderStyleNone];
    //launch correct keyboard for each text field
    exerciseName.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    [repsAmount setKeyboardType:UIKeyboardTypeNumberPad];
    [weightAmount setKeyboardType:UIKeyboardTypeNumberPad];
    [restMinutesField setKeyboardType:UIKeyboardTypeNumberPad];
    [restSecondsField setKeyboardType:UIKeyboardTypeNumberPad];
    UIColor *pink = [UIColor colorWithRed:0.91
                                    green:0.12
                                     blue:0.39
                                    alpha:1.0];
    exerciseName.textColor = pink;
    repsAmount.textColor = pink;
    weightAmount.textColor = pink;
    restMinutesField.textColor = pink;
    restSecondsField.textColor = pink;
    exerciseName.font = large;
    repsAmount.font = large;
    weightAmount.font = large;
    restMinutesField.font = large;
    restSecondsField.font = large;
    UIColor *whiteColor = [UIColor colorWithRed:1.0
                                         green:1.0
                                          blue:1.0
                                         alpha:1.0];
    [addSetButton setTitleColor:whiteColor forState:UIControlStateNormal];
    [addSetButton.titleLabel setFont:large];
    [addWorkout setTitleColor:whiteColor forState:UIControlStateNormal];
    [addWorkout.titleLabel setFont:large];
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    
    UIColor *darkBlue = [UIColor colorWithRed:0.01
                                        green:0.61
                                         blue:0.90
                                        alpha:1.0];
    [labelView setBackgroundColor:blue];
    [statusView setBackgroundColor:darkBlue];
    
    //page title custom settings
    [pageTitle setFont:large];
    [pageTitle setTextColor:whiteColor];
    [self floatingLabels];
    [self sideBarCustom];
}

-(void)floatingLabels
{
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular"
                                       size:12];

    exerciseNameLabel.hidden = YES;
    repsNameLabel.hidden = YES;
    weightNameLabel.hidden = YES;
    restMinutesLabel.hidden = YES;
    restSecondsLabel.hidden = YES;
    exerciseNameLabel.font = standard;
    repsNameLabel.font = standard;
    weightNameLabel.font = standard;
    restMinutesLabel.font = standard;
    restSecondsLabel.font = standard;
    
}

-(void)textFieldChange:(UITextField *)textField label:(UILabel *)floatingLabel
{
    UIImage *backgroundImage = [UIImage imageNamed:@"FormActive"];
    [textField setBackground:backgroundImage];
    UIColor *pink = [UIColor colorWithRed:0.91
                                    green:0.12
                                     blue:0.39
                                    alpha:1.0];
    [textField setTextColor:pink];
    [floatingLabel setTextColor:pink];
    floatingLabel.hidden = NO;
}

-(void)textFieldDone:(UITextField *)textField label:(UILabel *)floatingLabel
{
    UIImage *backgroundImage = [UIImage imageNamed:@"FormNonActive"];
    [textField setBackground:backgroundImage];
    UIColor *grey = [UIColor colorWithRed:0.38
                                    green:0.38
                                     blue:0.38
                                    alpha:1.0];
    [textField setTextColor:grey];
    [floatingLabel setTextColor:grey];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //HMoveHomeViewController *viewController = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"workoutPreviewSegue"]) {
        HMoveEditPreviewViewController *viewController = [segue destinationViewController];
        [viewController setWorkoutData:theNewWorkoutData];
    }
}


#pragma mark - Side Bar
-(void)sideBarCustom
{
    navView.layer.zPosition = 1;
    UIColor *white = [UIColor colorWithRed:1.0
                                     green:1.0
                                      blue:1.0
                                     alpha:1.0];
    
    UIColor *grey = [UIColor colorWithRed:0.38
                                    green:0.38
                                     blue:0.38
                                    alpha:1.0];
    navView.backgroundColor = white;
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular"
                                       size:16.0];
    navLabel.font = standard;
    navLabel.textColor = grey;
    homeNavButton.titleLabel.font = standard;
    calenderNavButton.titleLabel.font = standard;
    signOutButton.titleLabel.font = standard;
    [homeNavButton.titleLabel setTextColor:grey];
    [calenderNavButton.titleLabel setTextColor:grey];
    [signOutButton.titleLabel setTextColor:grey];
}

-(void)slide
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    
    CGRect frame = navView.frame;
    //frame.origin.x = 0;
    if(frame.origin.x == 0){
        frame.origin.x = -168;
        [self hideMenuShadow:navView];
    } else {
        frame.origin.x = 0;
        [self styleMenu:navView];
    }
    
    navView.frame = frame;
    [UIView commitAnimations];
}

-(void)hideMenuShadow:(UIView*)view{
    navView.layer.shadowOpacity = 0.0f;
}

-(void)styleMenu:(UIView*)view{
    //apply shadow to FAB by adding a layer beneth it
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:navView.bounds];
    navView.layer.masksToBounds = NO;
    navView.layer.shadowColor = [UIColor blackColor].CGColor;
    navView.layer.shadowOffset = CGSizeMake(6.0, 0.0);
    navView.layer.shadowOpacity = 0.24f;
    navView.layer.shadowPath = shadowPath.CGPath;
}

- (IBAction)exerciseNameBegin:(id)sender {
    [self textFieldChange:exerciseName label:exerciseNameLabel];
}

- (IBAction)exerciseNameEnd:(id)sender {
    [self textFieldDone:exerciseName label:exerciseNameLabel];
}

- (IBAction)repsAmountBegin:(id)sender {
    [self textFieldChange:repsAmount label:repsNameLabel];
}

- (IBAction)repsAmountEnd:(id)sender {
    [self textFieldDone:repsAmount label:repsNameLabel];
}

- (IBAction)weightAmountBegin:(id)sender {
    [self textFieldChange:weightAmount label:weightNameLabel];
}

- (IBAction)weightAmountEnd:(id)sender {
    [self textFieldDone:weightAmount label:weightNameLabel];
}

- (IBAction)restMinutesBegin:(id)sender {
    [self textFieldChange:restMinutesField label:restMinutesLabel];
}

- (IBAction)restMinutesEnd:(id)sender {
    [self textFieldDone:restMinutesField label:restMinutesLabel];
}

- (IBAction)restSecondsBegin:(id)sender {
    [self textFieldChange:restSecondsField label:restSecondsLabel];
}

- (IBAction)restSecondsEnd:(id)sender {
    [self textFieldDone:restSecondsField label:restSecondsLabel];
}

- (IBAction)navSidebar:(id)sender {
    [self slide];
}

- (IBAction)workoutPreview:(id)sender {
    [self performSegueWithIdentifier:@"workoutPreviewSegue" sender:self];
}

- (IBAction)segueHome:(id)sender {
    //NSLog(@"Home");
    [self performSegueWithIdentifier:@"homeSegue" sender:self];
}

- (IBAction)addSetAction:(id)sender {
    NSLog(@"New Set being added");
    currentSetCount++;
    NSMutableDictionary *currentSet = [[NSMutableDictionary alloc] init];
    [currentSet setObject:exerciseName.text forKey:@"Exercise"];
    [currentSet setObject:repsAmount.text forKey:@"Reps"];
    [currentSet setObject:weightAmount.text forKey:@"Weight"];
    [currentSet setObject:restMinutesField.text forKey:@"RestMinutes"];
    [currentSet setObject:restSecondsField.text forKey:@"RestSeconds"];
    NSMutableString *setNumber = [[NSMutableString alloc] initWithString:@"Set"];
    [setNumber appendString:[NSString stringWithFormat:@"%d", currentSetCount]];
    [theNewWorkoutData setObject:currentSet forKey:setNumber];
    [exerciseName resignFirstResponder];
    [repsAmount resignFirstResponder];
    [weightAmount resignFirstResponder];
    [restMinutesField resignFirstResponder];
    [restSecondsField resignFirstResponder];
    exerciseName.text = @"";
    repsAmount.text = @"";
    weightAmount.text = @"";
    restMinutesField.text = @"";
    restSecondsField.text = @"";
    [exerciseName becomeFirstResponder];
    
    NSLog(@"%@", theNewWorkoutData);
}

@end
