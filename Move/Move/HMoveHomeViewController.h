//
//  HMoveHomeViewController.h
//  Move
//
//  Created by Cody Weaver on 8/27/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMoveCounterViewController.h"


@interface HMoveHomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *pageTitle;
@property (weak, nonatomic) IBOutlet UIView *pageNav;
@property (strong, nonatomic) IBOutlet UILabel *pageTitleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *jsonData;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (strong, nonatomic) NSMutableArray *badSets;
@property (strong, nonatomic) NSMutableArray *goodSets;
@property (strong, nonatomic) IBOutlet UIView *navSidebar;
@property (strong, nonatomic) IBOutlet UIButton *navHomeButton;
@property (strong, nonatomic) IBOutlet UIButton *navCalenderButton;
@property (strong, nonatomic) IBOutlet UILabel *navLabel;
@property (strong, nonatomic) IBOutlet UIButton *navCloseButton;
@property (strong, nonatomic) IBOutlet UIButton *signOutButton;
- (IBAction)openSideBar:(id)sender;



@property (nonatomic) int setCount;
@property (nonatomic) int rest;
@end
