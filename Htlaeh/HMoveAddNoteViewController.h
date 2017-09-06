//
//  HMoveAddNoteViewController.h
//  Htlaeh
//
//  Created by Cody Weaver on 2/12/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMoveHomeViewController.h"

@interface HMoveAddNoteViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *pageLabel;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) UIFont *regular;
@property (strong, nonatomic) UILabel *characterCount;
@property (strong, nonatomic) NSArray *goodSets;
@property (strong, nonatomic) NSArray *badSets;
@property (strong, nonatomic) NSString *noteText;
@property (strong, nonatomic) NSString *originalText;
@property (nonatomic) int setCount;
- (IBAction)backButton:(id)sender;
-(void)textViewDidBeginEditing:(UITextView *)textView;
@end
