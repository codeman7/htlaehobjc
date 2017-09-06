//
//  HMoveResetViewController.h
//  Htlaeh
//
//  Created by Cody Weaver on 3/24/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMoveResetViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *htlaehLogo;
@property (strong, nonatomic) IBOutlet UILabel *emailFloatingLabel;
@property (strong, nonatomic) IBOutlet UILabel *birthYearFloatingLabel;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *birthYearTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) IBOutlet UIButton *errorCloseButton;
@property (strong, nonatomic) IBOutlet UIView *errorView;
@property (strong, nonatomic) IBOutlet UILabel *errorViewLabel;
@property (strong, nonatomic) IBOutlet UILabel *errorViewText;
@property (strong, nonatomic) IBOutlet UIButton *buttonLeft;
@property (strong, nonatomic) IBOutlet UIButton *buttonRight;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UILabel *confirmPasswordLabel;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (nonatomic) NSInteger reset;
@property (strong, nonatomic) IBOutlet UILabel *passwordError;
- (IBAction)emailEnd:(id)sender;
- (IBAction)emailBegin:(id)sender;
- (IBAction)birthYearEnd:(id)sender;
- (IBAction)birthYearBegin:(id)sender;
- (IBAction)passwordEnd:(id)sender;
- (IBAction)passwordBegin:(id)sender;
- (IBAction)confirmEnd:(id)sender;
- (IBAction)confirmBegin:(id)sender;

@end
