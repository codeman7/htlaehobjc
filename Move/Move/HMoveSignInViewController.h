//
//  HMoveSignInViewController.h
//  Move
//
//  Created by Cody Weaver on 8/4/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMoveSignInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *TitleView;
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;
@property (weak, nonatomic) IBOutlet UIView *notificationBar;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotPassword;
@property (weak, nonatomic) IBOutlet UIButton *forgotEmail;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UILabel *emailTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordTextLabel;
- (IBAction)emailEditBegin:(id)sender;
- (IBAction)emailEditEnd:(id)sender;
- (IBAction)passwordEditEnd:(id)sender;
- (IBAction)passwordEditBegin:(id)sender;

@end
