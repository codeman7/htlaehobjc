//
//  HMoveEditPreviewViewController.h
//  Htlaeh
//
//  Created by Cody Weaver on 12/27/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMoveEditViewController.h"

@interface HMoveEditPreviewViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *statusView;
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *pageLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *workoutData;
- (IBAction)backAction:(id)sender;
@end
