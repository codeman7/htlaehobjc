//
//  HMoveAddNoteViewController.m
//  Htlaeh
//
//  Created by Cody Weaver on 2/12/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import "HMoveAddNoteViewController.h"

@interface HMoveAddNoteViewController ()

@end

@implementation HMoveAddNoteViewController

@synthesize topView, pageLabel, backButton, textView, regular, characterCount, goodSets, badSets, setCount, noteText, originalText;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    HMoveHomeViewController *viewController = [segue destinationViewController];
    [viewController setGoodSets:goodSets];
    [viewController setBadSets:badSets];
    [viewController setNote:noteText];
    [viewController setSetCount:setCount];
    [viewController setLastVC:@"Note"];
}


-(void)customLoad
{
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    topView.backgroundColor = blue;
    //add shadow to the top view
    topView.layer.masksToBounds = NO;
    topView.layer.shadowColor = [UIColor blackColor].CGColor;
    topView.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    topView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    topView.layer.shouldRasterize = YES;
    topView.layer.shadowOpacity = 0.24f;
    
    //label stuff
    regular = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    pageLabel.font = regular;
    pageLabel.text = @"Add Note";
    pageLabel.textColor = [UIColor whiteColor];
    [self textViewMethod];
    
    //add note label customization
    UIColor *grey = [UIColor colorWithRed:0.38
                                    green:0.38
                                     blue:0.38
                                    alpha:1.0];
    characterCount = [[UILabel alloc] init];
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        characterCount.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 80, [UIScreen mainScreen].bounds.size.height - 272, 60, 21);
    } else if ([UIScreen mainScreen].bounds.size.height == 667){
        characterCount.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -80, [UIScreen mainScreen].bounds.size.height - 281, 60, 21);
    } else if ([UIScreen mainScreen].bounds.size.height == 736){
        characterCount.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 80, [UIScreen mainScreen].bounds.size.height - 342, 60, 21);
    } else {
        characterCount.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 80, [UIScreen mainScreen].bounds.size.height - 176, 60, 21);
    }
    [self.view addSubview:characterCount];
    characterCount.textAlignment = NSTextAlignmentRight;
}

-(void)textViewMethod
{
    textView.text = @"Insert note here";
    textView.textColor = [UIColor lightGrayColor];
    textView.font = regular;
    textView.backgroundColor = [UIColor clearColor];
    textView.delegate = self;
    UIColor *gray = [UIColor colorWithRed:0.38
                                    green:0.38
                                     blue:0.38
                                    alpha:1.0];
    characterCount.textColor = gray;
    characterCount.hidden = YES;
    
}

-(void)editText
{
    originalText = textView.text;
    if (originalText.length > 250) {
        NSRange stringRange = {0,250};
        noteText = [originalText substringWithRange:stringRange];
    } else {
        noteText = originalText;
    }
}



- (IBAction)backButton:(id)sender {
    [self editText];
    [self performSegueWithIdentifier:@"noteToHome" sender:self];
}

-(void)textViewDidBeginEditing:(UITextView *)textViewVar
{
    textViewVar.text = @"";
    UIColor *pink = [UIColor colorWithRed:0.91
                                    green:0.12
                                     blue:0.39
                                    alpha:1.0];
    characterCount.hidden = NO;
    textView.textColor = [UIColor blackColor];
    
    /*int numberLines = textView.contentSize.height / textView.font.lineHeight;
    if (numberLines > 1) {
        NSLog(@"%d", numberLines);

    }*/
    characterCount.font = [UIFont fontWithName:@"Roboto-Regular" size:12.0];
    characterCount.textColor = pink;
    characterCount.text = [NSString stringWithFormat:@"%lu/250", (long)textView.text.length];
}

-(void)textViewDidChange:(UITextView *)textViewVar
{
    UIColor *red = [UIColor colorWithRed:0.90
                                   green:0.11
                                    blue:0.14
                                   alpha:1.0];
    UIColor *pink = [UIColor colorWithRed:0.91
                                    green:0.12
                                     blue:0.39
                                    alpha:1.0];
    characterCount.text = [NSString stringWithFormat:@"%lu/250", (long)textView.text.length];
    if (textView.text.length > 250) {
        characterCount.textColor = red;
        textView.textColor = red;
    } else {
        characterCount.textColor = pink;
        textView.textColor = [UIColor blackColor];
    }
}

@end
