//
//  HMoveCalenderViewController.h
//  Htlaeh
//
//  Created by Cody Weaver on 1/31/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMoveEditViewController.h"
#import "HMoveViewViewController.h"

@interface HMoveCalenderViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *pageNav;
@property (strong, nonatomic) NSString *lastVC;
@property (nonatomic) long month;
@property (strong, nonatomic) IBOutlet UILabel *htlaehName;
@property (strong, nonatomic) IBOutlet UIButton *homeButton;
@property (strong, nonatomic) IBOutlet UIButton *calenderButton;
@property (strong, nonatomic) IBOutlet UIButton *signOutButton;
@property (strong, nonatomic) NSMutableDictionary *workoutData;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UILabel *pageLabel;
@property (strong, nonatomic) IBOutlet UILabel *largeMonth;
@property (strong, nonatomic) IBOutlet UILabel *largeDay;
@property (strong, nonatomic) IBOutlet UILabel *largeYear;
@property (strong, nonatomic) IBOutlet UIView *bottomCenterView;
@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UIButton *okButton;
@property (strong, nonatomic) IBOutlet UILabel *monthYearSmall;
@property (strong, nonatomic) IBOutlet UILabel *sundayLabel;
@property (strong, nonatomic) IBOutlet UILabel *mondayLabel;
@property (strong, nonatomic) IBOutlet UILabel *tuesdayLabel;
@property (strong, nonatomic) IBOutlet UILabel *wednesdayLabel;
@property (strong, nonatomic) IBOutlet UILabel *thursdayLabel;
@property (strong, nonatomic) IBOutlet UILabel *fridayLabel;
@property (strong, nonatomic) IBOutlet UILabel *saturdayLabel;
@property (strong, nonatomic) NSMutableArray *calendarButtons;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *rowOneColOne;
@property (strong, nonatomic) IBOutlet UIButton *rowOneColTwo;
@property (strong, nonatomic) IBOutlet UIButton *rowOneColThr;
@property (strong, nonatomic) IBOutlet UIButton *rowOneColFou;
@property (strong, nonatomic) IBOutlet UIButton *rowOneColFiv;
@property (strong, nonatomic) IBOutlet UIButton *rowOneColSix;
@property (strong, nonatomic) IBOutlet UIButton *rowOneColSev;
@property (strong, nonatomic) IBOutlet UIButton *rowTwoColOne;
@property (strong, nonatomic) IBOutlet UIButton *rowTwoColTwo;
@property (strong, nonatomic) IBOutlet UIButton *rowTwoColThr;
@property (strong, nonatomic) IBOutlet UIButton *rowTwoColFou;
@property (strong, nonatomic) IBOutlet UIButton *rowTwoColFiv;
@property (strong, nonatomic) IBOutlet UIButton *rowTwoColSix;
@property (strong, nonatomic) IBOutlet UIButton *rowTwoColSev;
@property (strong, nonatomic) IBOutlet UIButton *rowThrColOne;
@property (strong, nonatomic) IBOutlet UIButton *rowThrColTwo;
@property (strong, nonatomic) IBOutlet UIButton *rowThrColThr;
@property (strong, nonatomic) IBOutlet UIButton *rowThrColFou;
@property (strong, nonatomic) IBOutlet UIButton *rowThrColFiv;
@property (strong, nonatomic) IBOutlet UIButton *rowThrColSix;
@property (strong, nonatomic) IBOutlet UIButton *rowThrColSev;
@property (strong, nonatomic) IBOutlet UIButton *rowFouColOne;
@property (strong, nonatomic) IBOutlet UIButton *rowFouColTwo;
@property (strong, nonatomic) IBOutlet UIButton *rowFouColThr;
@property (strong, nonatomic) IBOutlet UIButton *rowFouColFou;
@property (strong, nonatomic) IBOutlet UIButton *rowFouColFiv;
@property (strong, nonatomic) IBOutlet UIButton *rowFouColSix;
@property (strong, nonatomic) IBOutlet UIButton *rowFouColSev;
@property (strong, nonatomic) IBOutlet UIButton *rowFivColOne;
@property (strong, nonatomic) IBOutlet UIButton *rowFivColTwo;
@property (strong, nonatomic) IBOutlet UIButton *rowFivColThr;
@property (strong, nonatomic) IBOutlet UIButton *rowFivColFou;
@property (strong, nonatomic) IBOutlet UIButton *rowFivColFiv;
@property (strong, nonatomic) IBOutlet UIButton *rowFivColSix;
@property (strong, nonatomic) IBOutlet UIButton *rowSixColOne;
@property (strong, nonatomic) IBOutlet UIButton *rowSixColTwo;
@property (strong, nonatomic) IBOutlet UIButton *rowSixColFou;
@property (strong, nonatomic) IBOutlet UIButton *rowSixColFiv;
@property (strong, nonatomic) IBOutlet UIButton *rowSixColThr;
@property (strong, nonatomic) IBOutlet UIButton *rowSixColSix;
@property (strong, nonatomic) IBOutlet UIButton *rowSixColSev;
@property (strong, nonatomic) IBOutlet UIButton *rowFivColSev;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *calenderNumbers;
@property (nonatomic) NSString *monthText;
@property (nonatomic) NSString *dayText;
@property (nonatomic) NSString *yearText;
- (IBAction)buttonTouch:(id)sender;
- (IBAction)okButtonAction:(id)sender;
- (IBAction)slideMenu:(id)sender;
@property (strong, nonatomic) NSMutableArray *days;
@property (strong, nonatomic) NSString *user;



@end
