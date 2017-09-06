//
//  HMoveViewViewController.m
//  Htlaeh
//
//  Created by Cody Weaver on 2/13/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import "HMoveViewViewController.h"
#define url @"http://tidy-bliss-523.appspot.com/add"


@interface HMoveViewViewController ()

@end

@implementation HMoveViewViewController

@synthesize pageLabel, pageTableView, pageTopView, regular, tableViewVar, jsonData, day, month, year;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //get data
    [self getData];
    //custom loading
    [self customLoad];
    tableViewVar.delegate = self;
    tableViewVar.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)getData
{
    if (jsonData == nil) {
        //get data for the table
        NSURL *dataUrl = [NSURL URLWithString:url];
        NSData *data = [NSData dataWithContentsOfURL:dataUrl];
        jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                   options:0
                                                     error:NULL];
        /*if (data == NULL){
            [self dataError];
        } else {
            jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                       options:0
                                                         error:NULL];
            tableView.hidden = NO;
        }*/
    }
}

-(void)customLoad
{
    
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    pageTopView.backgroundColor = blue;
    pageTopView.layer.masksToBounds = NO;
    pageTopView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    pageTopView.layer.shadowColor = [UIColor blackColor].CGColor;
    pageTopView.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    pageTopView.layer.shadowOpacity = 0.24f;
    pageTopView.layer.shouldRasterize = YES;
    regular = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    pageLabel.font = regular;
    pageLabel.textColor = [UIColor whiteColor];
    if (month > 0) {
        pageLabel.text = [NSString stringWithFormat:@"Workout %ld/%ld/%ld", month, day, year];

    } else
    {
        pageLabel.text = @"Workout";
    }
    
}

- (IBAction)backAction:(id)sender {
    
    [self performSegueWithIdentifier:@"viewToCal" sender:self];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return jsonData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //make it so there is no line between cells
    self.tableViewVar.separatorColor = [UIColor clearColor];
    //doesn't allow row to become grey on click
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //custom font for all the top labels
    UIFont *small = [UIFont fontWithName:@"Roboto-Regular" size:12.0];
    UILabel *exerciseHeader = (UILabel *)[cell viewWithTag:1];
    exerciseHeader.font = small;
    UILabel *repsHeader = (UILabel *)[cell viewWithTag:3];
    repsHeader.font = small;
    UILabel *weightHeader = (UILabel *)[cell viewWithTag:5];
    weightHeader.font = small;
    UILabel *restHeader = (UILabel *)[cell viewWithTag:7];
    restHeader.font = small;
    
    //assign variables to the labels
    UILabel *exerciseLabel = (UILabel *)[cell viewWithTag:2];
    UILabel *repsLabel = (UILabel *)[cell viewWithTag:4];
    UILabel *weightLabel = (UILabel *)[cell viewWithTag:6];
    UILabel *restLabel = (UILabel *)[cell viewWithTag:8];
    
    //custom cell stuff
    exerciseLabel.font = regular;
    repsLabel.font = regular;
    weightLabel.font = regular;
    restLabel.font = regular;
    
    //create variable to get data out and put in correct cell
    long indexPlusOne = (indexPath.row) + 1;
    NSString *indexCountString = [@(indexPlusOne) stringValue];
    
    //keys to query the dictionary
    NSMutableString *exerciseKey = [NSMutableString stringWithFormat:@"Set%@.Exercise", indexCountString];
    NSMutableString *repsKey = [NSMutableString stringWithFormat:@"Set%@.Reps", indexCountString];
    NSMutableString *weightKey = [NSMutableString stringWithFormat:@"Set%@.Weight", indexCountString];
    NSMutableString *restKey = [NSMutableString stringWithFormat:@"Set%@.Rest", indexCountString];
    exerciseLabel.text = [jsonData valueForKeyPath:exerciseKey];
    repsLabel.text = [[jsonData valueForKeyPath:repsKey] stringValue];
    weightLabel.text = [[jsonData valueForKeyPath:weightKey] stringValue];
    restLabel.text = [[jsonData valueForKeyPath:restKey] stringValue];
    
    
    return cell;
}
@end
