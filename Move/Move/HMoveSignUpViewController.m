//
//  HMoveSignUpViewController.m
//  Move
//
//  Created by Cody Weaver on 8/10/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HMoveSignUpViewController.h"
#define url @"http://tidy-bliss-523.appspot.com/add"


@interface HMoveSignUpViewController ()

@end

@implementation HMoveSignUpViewController

@synthesize headerView, statusBarView, pageLabel, emailFloatLabel, passwordFloatLabel, confirmPasswordFloatLabel, emailTextField, passwordTextField, submitButton, confirmPasswordTextField, kgLabel, lbLabel, lbRadio, kgRadio, emailError, passwordError, passwordConfirmError;

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
    [self customLoad];
    [super viewDidLoad];
    //[self retriveData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customLoad
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    UIFont *large = [UIFont fontWithName:@"Roboto-Regular" size:16];
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular" size:12];
    [self floatingLabelsLoad];
    pageLabel.font = large;
    [emailTextField setBorderStyle:UITextBorderStyleNone];
    [passwordTextField setBorderStyle:UITextBorderStyleNone];
    [confirmPasswordTextField setBorderStyle:UITextBorderStyleNone];
    headerView.backgroundColor = [UIColor colorWithRed:0.01 green:0.66 blue:0.96 alpha:1.0];
    statusBarView.backgroundColor = [UIColor colorWithRed:0.01 green:0.61 blue:0.90 alpha:1.0];
    emailTextField.font = large;
    passwordTextField.font = large;
    confirmPasswordTextField.font = large;
    UIColor *pink = [UIColor colorWithRed:0.91 green:0.12 blue:0.39 alpha:1.0];
    emailTextField.textColor = pink;
    passwordTextField.textColor = pink;
    confirmPasswordTextField.textColor = pink;
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:headerView.bounds];
    headerView.layer.masksToBounds = NO;
    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
    headerView.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    headerView.layer.shadowOpacity = 0.24f;
    headerView.layer.shadowPath = shadowPath.CGPath;
    submitButton.titleLabel.font = standard;
    lbLabel.font = large;
    kgLabel.font = large;
}

-(void)floatingLabelsLoad
{
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular" size:12];
    emailFloatLabel.hidden = YES;
    passwordFloatLabel.hidden = YES;
    confirmPasswordFloatLabel.hidden = YES;
    emailFloatLabel.font = standard;
    passwordFloatLabel.font = standard;
    confirmPasswordFloatLabel.font = standard;
    emailError.font = standard;
    passwordError.font = standard;
    passwordConfirmError.font = standard;
    UIColor *red = [UIColor colorWithRed:0.90 green:0.11 blue:0.14 alpha:1.0];
    emailError.textColor = red;
    passwordConfirmError.textColor = red;
    passwordError.textColor = red;
    emailError.hidden = YES;
    passwordError.hidden = YES;
    passwordConfirmError.hidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)textFieldChange:(UITextField *)textField label:(UILabel *)floatingLabel
{
    UIImage *backgroundImage = [UIImage imageNamed:@"FormActive"];
    [textField setBackground:backgroundImage];
    UIColor *pink = [UIColor colorWithRed:0.91 green:0.12 blue:0.39 alpha:1.0];
    [textField setTextColor:pink];
    [floatingLabel setTextColor:pink];
    floatingLabel.hidden = NO;
}

-(void)textFieldDone:(UITextField *)textField label:(UILabel *)floatingLabel
{
    UIImage *backgroundImage = [UIImage imageNamed:@"FormNonActive"];
    [textField setBackground:backgroundImage];
    UIColor *grey = [UIColor colorWithRed:0.38 green:0.38 blue:0.38 alpha:1.0];
    [textField setTextColor:grey];
    [floatingLabel setTextColor:grey];
}

- (IBAction)emailBegin:(id)sender {
    [self textFieldChange:emailTextField label:emailFloatLabel];
}

- (IBAction)emailEnd:(id)sender {
    [self textFieldDone:emailTextField label:emailFloatLabel];
}

- (IBAction)passwordEnd:(id)sender {
    [self textFieldDone:passwordTextField label:passwordFloatLabel];
}

- (IBAction)passwordBegin:(id)sender {
    [self textFieldChange:passwordTextField label:passwordFloatLabel];
}

- (IBAction)confirmPasswordEnd:(id)sender {
    [self textFieldDone:confirmPasswordTextField label:confirmPasswordFloatLabel];
}

- (IBAction)confirmPasswordBegin:(id)sender {
    [self textFieldChange:confirmPasswordTextField label:confirmPasswordFloatLabel];
}

- (IBAction)signUpSubmit:(id)sender {
    UIImage *formError = [UIImage imageNamed:@"FormError"];
    if(![self validateEmailWithString:emailTextField.text]){
        emailError.hidden = NO;
        passwordConfirmError.hidden = YES;
        passwordError.hidden = YES;
        emailTextField.background = formError;
        //go to next step change if statement to have exmation mark to it just checks if its bad if its good nothin happens
    } else if (![self passwordCheck:passwordTextField.text]){
        passwordError.hidden = NO;
        emailError.hidden = YES;
        passwordConfirmError.hidden = YES;
        passwordTextField.background = formError;
    } else if(![self confirmPasswordCheck:passwordTextField.text confirm:confirmPasswordTextField.text]){
        passwordConfirmError.hidden = NO;
        emailError.hidden = YES;
        passwordError.hidden = YES;
        confirmPasswordTextField.background = formError;
    } else {
        [self sumbitData];
    }
}

-(void)sumbitData
{
    NSString *scale;
    UIImage *radioDeSelect = [UIImage imageNamed:@"RadioDeSelect"];
    if ([lbRadio currentBackgroundImage] == radioDeSelect) {
        scale = @"KG";
    } else {
        scale = @"LB";
    }
    NSString *postData = [NSString stringWithFormat:@"email=%@&password=%@&scale=%@", emailTextField.text, passwordTextField.text, scale];
    //add all the stuff to send that data to the url
}

- (IBAction)lbRadioAction:(id)sender {
    UIImage *radioSelect = [UIImage imageNamed:@"RadioSelect"];
    UIImage *radioDeSelect = [UIImage imageNamed:@"RadioDeSelect"];
    if ([lbRadio currentBackgroundImage] == radioDeSelect) {
        [lbRadio setBackgroundImage:radioSelect forState:UIControlStateNormal];
        [kgRadio setBackgroundImage:radioDeSelect forState:UIControlStateNormal];
    }
}

- (IBAction)kgRadioAction:(id)sender {
    UIImage *radioSelect = [UIImage imageNamed:@"RadioSelect"];
    UIImage *radioDeSelect = [UIImage imageNamed:@"RadioDeSelect"];
    if ([kgRadio currentBackgroundImage] == radioDeSelect) {
        [kgRadio setBackgroundImage:radioSelect forState:UIControlStateNormal];
        [lbRadio setBackgroundImage:radioDeSelect forState:UIControlStateNormal];
    }
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

-(BOOL)passwordCheck:(NSString *)password
{
    if (password.length <= 7) {
        return NO;
    } else {
      return YES;
    }
}

-(BOOL)confirmPasswordCheck:(NSString *)password confirm:(NSString *)secondPassword
{
    if (![password isEqualToString:secondPassword]) {
        return NO;
    } else{
        return YES;
    }
}

//data retrive practice
/* why in the world was i retriveing data
 -(void)retriveData
{
    NSURL *dataUrl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:dataUrl];
    NSMutableDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                options:0
                                                                  error:NULL];
    NSLog(@"Error = %@", [jsonData valueForKeyPath:@"SetThree.Weight"]);
    NSLog(@"%@", [jsonData description]);
}*/
@end
