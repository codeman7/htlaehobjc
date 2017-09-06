//
//  HMoveResetViewController.m
//  Htlaeh
//
//  Created by Cody Weaver on 3/24/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import "HMoveResetViewController.h"
#define url @"http://tidy-bliss-523.appspot.com/reset"


@interface HMoveResetViewController ()

@end

@implementation HMoveResetViewController

@synthesize backButton, birthYearFloatingLabel, birthYearTextField, emailFloatingLabel, emailTextField, htlaehLogo, submitButton, errorCloseButton, errorView, errorViewLabel, errorViewText, buttonLeft, buttonRight, passwordField, passwordLabel, confirmPasswordField, confirmPasswordLabel, reset, passwordError;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customLoad
{
    UIFont *large = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    UIFont *buttonFont = [UIFont fontWithName:@"Roboto-Medium" size:14.0];
    UIColor *pink = [UIColor colorWithRed:0.91
                                    green:0.12
                                     blue:0.39
                                    alpha:1.0];
    htlaehLogo.font = large;
    htlaehLogo.textColor = pink;
    [emailTextField setBorderStyle:UITextBorderStyleNone];
    [birthYearTextField setBorderStyle:UITextBorderStyleNone];
    emailTextField.font = large;
    birthYearTextField.font = large;
    passwordField.font = large;
    confirmPasswordField.font = large;
    confirmPasswordField.textColor = pink;
    passwordField.textColor = pink;
    emailTextField.textColor = pink;
    birthYearTextField.textColor = pink;
    [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [birthYearTextField setKeyboardType:UIKeyboardTypeNumberPad];

    submitButton.titleLabel.font = buttonFont;
    
    //button stuff
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    backButton.layer.cornerRadius = 24.0f;
    backButton.layer.masksToBounds = NO;
    backButton.layer.shadowColor = [UIColor blackColor].CGColor;
    backButton.layer.shadowOpacity = 0.24f;
    backButton.layer.shadowRadius = 3.0f;
    backButton.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    backButton.layer.shouldRasterize = YES;
    backButton.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    [backButton setBackgroundColor:blue];
    [backButton addTarget:self action:@selector(segueToSignUp) forControlEvents:UIControlEventTouchUpInside];
    [submitButton addTarget:self action:@selector(submitInfo) forControlEvents:UIControlEventTouchUpInside];
    
    submitButton.layer.masksToBounds = NO;
    [submitButton setBackgroundColor:blue];
    submitButton.layer.shadowColor = [UIColor blackColor].CGColor;
    submitButton.layer.shadowOpacity = 0.24f;
    submitButton.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    submitButton.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    submitButton.layer.shouldRasterize = YES;
    submitButton.layer.shadowRadius = 3.0f;
    passwordField.layer.hidden = YES;
    confirmPasswordField.layer.hidden = YES;
    [passwordField setBorderStyle:UITextBorderStyleNone];
    [confirmPasswordField setBorderStyle:UITextBorderStyleNone];
    [self floatingLabels];
    [self errorViewMethod];
    reset = 0;
    passwordError.hidden = YES;
}

-(void)errorViewMethod
{
    errorView.layer.masksToBounds = NO;
    errorView.layer.shadowColor = [UIColor blackColor].CGColor;
    errorView.layer.shadowOpacity = 0.24f;
    errorView.layer.shadowOffset = CGSizeMake(0.0, 4.0);
    errorView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    errorView.layer.shouldRasterize = YES;
    errorView.layer.shadowRadius = 6.0f;
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    [buttonRight setTitleColor:blue forState:UIControlStateNormal];
    [buttonLeft setTitleColor:blue forState:UIControlStateNormal];
    UIFont *buttonFont = [UIFont fontWithName:@"Roboto-Medium" size:14];
    buttonRight.titleLabel.font = buttonFont;
    buttonLeft.titleLabel.font = buttonFont;
    errorView.layer.hidden = YES;
}

-(void)floatingLabels
{
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular" size:12];
    emailFloatingLabel.hidden = YES;
    birthYearFloatingLabel.hidden = YES;
    emailFloatingLabel.font = standard;
    birthYearFloatingLabel.font = standard;
    confirmPasswordLabel.font = standard;
    passwordLabel.font = standard;
    passwordLabel.hidden = YES;
    confirmPasswordLabel.hidden = YES;
}

-(void)textFieldChange:(UITextField *)textField label:(UILabel *)floatingLabel
{
    UIImage *backgroundImage = [UIImage imageNamed:@"FormActive"];
    [textField setBackground:backgroundImage];
    UIColor *pink = [UIColor colorWithRed:0.91 green:0.12 blue:0.39 alpha:1.0];
    [textField setTextColor:pink];
    [floatingLabel setTextColor:pink];
    floatingLabel.hidden = NO;
    passwordError.hidden = YES;
}

-(void)textFieldDone:(UITextField *)textField label:(UILabel *)floatingLabel
{
    UIImage *backgroundImage = [UIImage imageNamed:@"FormNonActive"];
    [textField setBackground:backgroundImage];
    UIColor *grey = [UIColor colorWithRed:0.38 green:0.38 blue:0.38 alpha:1.0];
    [textField setTextColor:grey];
    [floatingLabel setTextColor:grey];
}

-(void)textFieldError:(UILabel *)label textField:(UITextField *)textField
{
    UIColor *red = [UIColor colorWithRed:0.90
                                   green:0.11
                                    blue:0.14
                                   alpha:1.0];
    label.textColor = red;
    [textField setBackground:[UIImage imageNamed:@"FormError"]];
    UIFont *errorFont = [UIFont fontWithName:@"Roboto-Regular" size:12.0];
    passwordError.font = errorFont;
    passwordError.textColor = red;
    passwordError.hidden = NO;
}

-(void)submitInfo
{
    if (![passwordField.text isEqualToString:confirmPasswordField.text]) {
        [self textFieldError:confirmPasswordLabel textField:confirmPasswordField];
    } else {
    
        NSString *postData = [NSString stringWithFormat:@"email=%@&device=iPhone&age=%@&reset=%ld&password=%@", emailTextField.text, birthYearTextField.text, (long)reset, passwordField.text];
        //add all the stuff to send that data to the url
    
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
        [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
        [request setHTTPMethod:@"POST"];
        NSError *error = nil;
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    
        if (reset == 0) {
            if (error) {
                NSLog(@"Error");
            } else {
                NSMutableDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                                      options:0
                                                                                        error:NULL];
                NSLog(@"server response %@", serverResponse);
                if ([serverResponse valueForKey:@"User"] == [NSNull null]) {
                    [self noEmail];
                } else {
                    [self resetPassword];
                }
                
            }
        } else {
            NSMutableDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                                  options:0
                                                                                    error:NULL];
            if ([[serverResponse valueForKey:@"Success"] intValue] == 1) {
                [self segueToSignIn];
                NSLog(@"No reset %@", serverResponse);
            } else {
                [self errorOccured];
                NSLog(@"No reset error %@", serverResponse);
            }
            
        }
        
        
    }
    
}

-(void)segueToSignIn
{
    [self performSegueWithIdentifier:@"resetToSignIn" sender:self];
}

-(void)errorOccured
{
    errorView.layer.hidden = NO;
    backButton.layer.hidden = YES;
    [errorCloseButton addTarget:self action:@selector(closeErrorView) forControlEvents:UIControlEventTouchUpInside];
    errorViewText.text = @"Sorry an error occured we are working on it.";
    errorViewText.numberOfLines = 0;
    [errorViewText sizeToFit];
    errorViewLabel.text = @"An error occured";
    buttonLeft.layer.hidden = YES;
    [buttonRight setTitle:@"OK" forState:UIControlStateNormal];
    [buttonRight addTarget:self action:@selector(closeErrorView) forControlEvents:UIControlEventTouchUpInside];
}

-(void)noEmail
{
    errorView.layer.hidden = NO;
    backButton.layer.hidden = YES;
    [errorCloseButton addTarget:self action:@selector(closeErrorView) forControlEvents:UIControlEventTouchUpInside];
    errorViewText.text = @"We could not find an account to match the information you entered.";
    errorViewText.numberOfLines = 0;
    [errorViewText sizeToFit];
    errorViewLabel.text = @"An error occured";
    buttonLeft.layer.hidden = YES;
    [buttonRight setTitle:@"OK" forState:UIControlStateNormal];
    [buttonRight addTarget:self action:@selector(closeErrorView) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)resetPassword
{
    reset = 1;
    errorView.layer.hidden = NO;
    backButton.layer.hidden = YES;
    [errorCloseButton addTarget:self action:@selector(closeErrorView) forControlEvents:UIControlEventTouchUpInside];
    errorViewText.text = @"Are you sure you want to reset your password for this account?";
    errorViewText.numberOfLines = 0;
    buttonLeft.layer.hidden = NO;
    [errorViewText sizeToFit];
    [buttonLeft setTitle:@"YES" forState:UIControlStateNormal];
    [buttonRight setTitle:@"NO" forState:UIControlStateNormal];
    [buttonLeft addTarget:self action:@selector(showPasswordFields) forControlEvents:UIControlEventTouchUpInside];
    [buttonRight addTarget:self
                    action:@selector(closeErrorView)
          forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)showPasswordFields{
    passwordField.layer.hidden = NO;
    confirmPasswordField.layer.hidden = NO;
    [self closeErrorView];
}

-(void)closeErrorView
{
    errorView.layer.hidden = YES;
    backButton.layer.hidden = NO;
}

-(void)segueToHome
{
    [self performSegueWithIdentifier:@"resetToHome" sender:self];
}

-(void)segueToSignUp
{
    [self performSegueWithIdentifier:@"resetToSignUp" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)emailEnd:(id)sender {
    [self textFieldDone:emailTextField label:emailFloatingLabel];
    
}

- (IBAction)emailBegin:(id)sender {
    [self textFieldChange:emailTextField label:emailFloatingLabel];
    [self swipeGesture:emailTextField];
}

- (IBAction)birthYearEnd:(id)sender {
    [self textFieldDone:birthYearTextField label:birthYearFloatingLabel];
}

- (IBAction)birthYearBegin:(id)sender {
    [self textFieldChange:birthYearTextField label:birthYearFloatingLabel];
    [self swipeGesture:birthYearTextField];
}

- (IBAction)passwordEnd:(id)sender {
    [self textFieldDone:passwordField label:passwordLabel];
}

- (IBAction)passwordBegin:(id)sender {
    [self textFieldChange:passwordField label:passwordLabel];
    [self swipeGesture:passwordField];
}

- (IBAction)confirmEnd:(id)sender {
    [self textFieldDone:confirmPasswordField label:confirmPasswordLabel];
}

- (IBAction)confirmBegin:(id)sender {
    [self textFieldChange:confirmPasswordField label:confirmPasswordLabel];
    [self swipeGesture:confirmPasswordField];
}



-(void)swipeGesture:(UITextField *)textField
{
    CGRect keyboardFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIView *keyboardView = [[UIView alloc] initWithFrame:keyboardFrame];
    [self.view insertSubview:keyboardView atIndex:0];
    UISwipeGestureRecognizer *swipeKeyboardAway = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipeKeyboardAway setDirection:UISwipeGestureRecognizerDirectionDown];
    [keyboardView addGestureRecognizer:swipeKeyboardAway];
    [textField setTag:1234];
    [keyboardView setTag:1];
}

-(void)swipe:(UISwipeGestureRecognizer *)sender
{
    UITextField *textField = (UITextField*)[self.view viewWithTag:1234];
    [textField becomeFirstResponder];
    [textField resignFirstResponder];
    [sender.view removeFromSuperview];
    UIView *keyboardView = (UIView*)[self.view viewWithTag:1];
    [keyboardView removeFromSuperview];
    
}
@end
