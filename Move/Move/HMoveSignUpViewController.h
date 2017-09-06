//
//  HMoveSignUpViewController.h
//  Move
//
//  Created by Cody Weaver on 8/10/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMoveSignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *statusBarView;
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailFloatLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordFloatLabel;
@property (weak, nonatomic) IBOutlet UILabel *confirmPasswordFloatLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
- (IBAction)emailBegin:(id)sender;
- (IBAction)emailEnd:(id)sender;
- (IBAction)passwordEnd:(id)sender;
- (IBAction)passwordBegin:(id)sender;
- (IBAction)confirmPasswordEnd:(id)sender;
- (IBAction)confirmPasswordBegin:(id)sender;
- (IBAction)signUpSubmit:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *lbRadio;
- (IBAction)lbRadioAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lbLabel;
@property (weak, nonatomic) IBOutlet UIButton *kgRadio;
- (IBAction)kgRadioAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *kgLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailError;
@property (weak, nonatomic) IBOutlet UILabel *passwordError;
@property (weak, nonatomic) IBOutlet UILabel *passwordConfirmError;

@end
