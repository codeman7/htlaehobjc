//
//  HErrorViewController.m
//  Move
//
//  Created by Cody Weaver on 9/10/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HErrorViewController.h"

@interface HErrorViewController ()

@end

@implementation HErrorViewController

@synthesize connectionLabel;

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
    [super viewDidLoad];
    [self customLoad];
    // Do any additional setup after loading the view.
}

-(void)customLoad
{
    UIColor *red = [UIColor colorWithRed:0.90 green:0.11 blue:0.14 alpha:1.0];
    UIFont *standard = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    connectionLabel.textColor = red;
    connectionLabel.font = standard;
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

@end
