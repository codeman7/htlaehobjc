//
//  HMoveSignInViewController.m
//  Move
//
//  Created by Cody Weaver on 8/4/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HMoveSignInViewController.h"

@interface HMoveSignInViewController ()

@end

@implementation HMoveSignInViewController

@synthesize TitleView, pageTitle, notificationBar, backButton, forgotEmail, forgotPassword, submit, passwordField, emailField, emailTextLabel, passwordTextLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)security
{
    NSString *keyToSearchFor = @"Email";
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *query = @{(__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge id)kSecAttrService : service,
                            (__bridge id)kSecAttrAccount : keyToSearchFor,
                            (__bridge id)kSecReturnData : (__bridge id)kCFBooleanTrue,
                            };
    
    CFDataRef cfValue = NULL;
    OSStatus result = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&cfValue);
    
    if (result == errSecSuccess) {
        NSString *value = [[NSString alloc] initWithData:(__bridge_transfer NSData *)cfValue encoding:NSUTF8StringEncoding];
        
        NSLog(@"Value = %@", value);
    } else {
        NSLog(@"Error happened with code: %ld", (long)result);
    }
    
    
}

-(void)customLayout
{
    UIFont *robotoSixteen = [UIFont fontWithName:@"Roboto-Regular" size:16];
    UIFont *robotoTwelve = [UIFont fontWithName:@"Roboto-Regular" size:12];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    notificationBar.backgroundColor = [UIColor colorWithRed:0.01 green:0.61 blue:0.90 alpha:1.0];
    TitleView.backgroundColor = [UIColor colorWithRed:0.01 green:0.66 blue:0.96 alpha:1.0];
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:TitleView.bounds];
    TitleView.layer.masksToBounds = NO;
    TitleView.layer.shadowColor = [UIColor blackColor].CGColor;
    TitleView.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    TitleView.layer.shadowOpacity = 0.24f;
    TitleView.layer.shadowPath = shadowPath.CGPath;
    pageTitle.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
    pageTitle.textColor = [UIColor whiteColor];
    forgotPassword.hidden = YES;
    forgotEmail.hidden = YES;
    forgotPassword.titleLabel.font = robotoTwelve;
    forgotEmail.titleLabel.font = robotoTwelve;
    UIColor *pink = [UIColor colorWithRed:0.91 green:0.12 blue:0.39 alpha:1.0];
    [forgotEmail setTitleColor:pink forState:UIControlStateNormal];
    [forgotPassword setTitleColor:pink forState:UIControlStateNormal];
    submit.titleLabel.font = robotoTwelve;
    
    //text field
    //password field
    [passwordField setBorderStyle:UITextBorderStyleNone];
    passwordField.font = robotoSixteen;
    passwordTextLabel.font = robotoTwelve;
    passwordTextLabel.hidden = YES;
    emailField.textColor = pink;
    //email field
    [emailField setBorderStyle:UITextBorderStyleNone];
    emailField.font = robotoSixteen;
    emailTextLabel.font = robotoTwelve;
    emailTextLabel.hidden = YES;
    passwordField.textColor = pink;
    
}

-(void)textFieldDidChange:(UITextField *)textField label:(UILabel *)floatingLabel
{
    UIColor *pink = [UIColor colorWithRed:0.91 green:0.12 blue:0.39 alpha:1.0];
    [textField setTextColor:pink];
    [floatingLabel setTextColor:pink];
    UIImage *formActive = [UIImage imageNamed:@"FormActive"];
    [textField setBackground:formActive];
    floatingLabel.hidden = NO;
    
}

-(void)textFieldDone:(UITextField *)textField label:(UILabel *)floatLabel
{
    UIColor *grey = [UIColor colorWithRed:0.38 green:0.38 blue:0.38 alpha:1.0];
    [textField setTextColor:grey];
    [floatLabel setTextColor:grey];
    UIImage *formNonActive = [UIImage imageNamed:@"FormNonActive"];
    [textField setBackground:formNonActive];
}

- (void)viewDidLoad
{
    [self customLayout];
    [self security];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)emailEditBegin:(id)sender {
    [self textFieldDidChange:emailField label:emailTextLabel];
}

- (IBAction)emailEditEnd:(id)sender {
    [self textFieldDone:emailField label:emailTextLabel];
}

- (IBAction)passwordEditEnd:(id)sender {
    [self textFieldDone:passwordField label:passwordTextLabel];
}

- (IBAction)passwordEditBegin:(id)sender {
    [self textFieldDidChange:passwordField label:passwordTextLabel];
}
@end
