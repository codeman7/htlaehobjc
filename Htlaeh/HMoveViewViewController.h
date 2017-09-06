//
//  HMoveViewViewController.h
//  Htlaeh
//
//  Created by Cody Weaver on 2/13/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface HMoveViewViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *pageTopView;
@property (strong, nonatomic) IBOutlet UILabel *pageLabel;
@property (strong, nonatomic) IBOutlet UITableView *pageTableView;
@property (nonatomic) UIFont *regular;
@property (strong, nonatomic) IBOutlet UITableView *tableViewVar;
@property (strong, nonatomic) NSMutableDictionary *jsonData;
@property (nonatomic) long year;
@property (nonatomic) long month;
@property (nonatomic) long day;

- (IBAction)backAction:(id)sender;

@end
