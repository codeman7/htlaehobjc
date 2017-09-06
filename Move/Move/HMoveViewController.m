//
//  HMoveViewController.m
//  Move
//
//  Created by Cody Weaver on 8/4/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HMoveViewController.h"

@interface HMoveViewController ()

@end

@implementation HMoveViewController

@synthesize companyName, SignInButton, SignUpButton;

- (void)viewDidLoad
{
    if (![self connectedToInternet]) {
        [self performSegueWithIdentifier:@"errorSegue" sender:self];
    }
    [self windowLoad];
    //[self security];
    [super viewDidLoad];    
	// Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)connectedToInternet
{
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] encoding:NSUTF8StringEncoding error:nil];
    return (URLString != NULL) ? YES : NO;
}

-(void)security
{
    NSString *key = @"Emai";
    NSString *value = @"codyleeweaver@gmail.com";
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *secItem = @{
                              (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                              (__bridge id)kSecAttrService : service,
                              (__bridge id)kSecAttrAccount : key,
                              (__bridge id)kSecValueData : valueData,
                              };
    
    CFTypeRef result = NULL;
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)secItem, &result);
    
    if(status == errSecSuccess){
        NSLog(@"Successfully stored the value");
    } else {
        NSLog(@"Failed to store the value with code: %ld", (long)status);
    }
}

-(void)windowLoad
{
    UIFont *robotoTwelve = [UIFont fontWithName:@"Roboto-Regular" size:12];
    companyName.font = [UIFont fontWithName:@"Roboto-Regular" size:21];
    companyName.textColor = [UIColor colorWithRed:0.01 green:0.66 blue:0.96 alpha:1.0];
    UIColor *white = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [SignInButton setTitleColor:white forState:UIControlStateNormal];
    SignInButton.titleLabel.font = robotoTwelve;
    [SignUpButton setTitleColor:white forState:UIControlStateNormal];
    SignUpButton.titleLabel.font = robotoTwelve;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
