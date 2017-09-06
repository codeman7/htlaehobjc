//
//  HMoveHomeViewController.m
//  Move
//
//  Created by Cody Weaver on 8/27/14.
//  Copyright (c) 2014 Htlaeh. All rights reserved.
//

#import "HMoveHomeViewController.h"
#define url @"http://tidy-bliss-523.appspot.com/add"


@interface HMoveHomeViewController ()

@end

@implementation HMoveHomeViewController

@synthesize pageNav, pageTitle, pageTitleLabel, jsonData, editButton, goodSets, badSets, tableView, setCount, rest, navSidebar, navHomeButton, navCalenderButton, navCloseButton, navLabel, signOutButton;


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
    [self getData];
    //something to do with no internet connection
    
    // Do any additional setup after loading the view.
    //set tableview delegate and datasource as itself
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //run custom load function
    [self customLoad];
    if(!setCount){
        setCount = 0;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom UI

-(void)customLoad
{
    //a bunch of custom UI Stuff
    pageTitle.backgroundColor = [UIColor colorWithRed:0.01 green:0.66 blue:0.96 alpha:1.0];
    pageNav.backgroundColor = [UIColor colorWithRed:0.01 green:0.61 blue:0.90 alpha:1.0];
    pageTitle.layer.masksToBounds = NO;
    pageTitle.layer.shadowColor = [UIColor blackColor].CGColor;
    pageTitle.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    pageTitle.layer.shadowOpacity = 0.24;
    pageTitle.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    pageTitle.layer.shouldRasterize = YES;
    pageTitleLabel.textColor = [UIColor whiteColor];
    pageTitleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    //run the FAB shadow function
    [self styleButton:editButton];
    //allocate space for both bad set and good set arrays
    if (goodSets == Nil){
        goodSets = [[NSMutableArray alloc] init];
    }
    
    if (badSets == Nil){
        badSets = [[NSMutableArray alloc] init];
    }
    
    //navigation bar custom
    [self navBar];
}





-(void)styleButton:(UIButton*)button
{
    //apply shadow to FAB by adding a layer beneth it
    CALayer *shadowLayer = [CALayer new];
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        NSLog(@"iPhone 5");
        shadowLayer.frame = editButton.frame;
    } else if ([UIScreen mainScreen].bounds.size.height == 667){
        shadowLayer.frame = CGRectMake(12, 603, 48, 48);
        NSLog(@"iPhone 6");
    } else if ([UIScreen mainScreen].bounds.size.height > 667){
        NSLog(@"iPhone 6+   %f", [UIScreen mainScreen].bounds.size.height);
        
        shadowLayer.frame = CGRectMake(12, 672, 48, 48);
    } else {
        shadowLayer.frame = CGRectMake(12, 416, 48, 48);
    }
    
    shadowLayer.cornerRadius = 24.0;
    shadowLayer.backgroundColor = [UIColor whiteColor].CGColor;
    shadowLayer.opacity = 1.0;
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;
    shadowLayer.shadowOpacity = 0.48;
    shadowLayer.shadowOffset = CGSizeMake(0.0, 3.0);
    shadowLayer.shadowRadius = 3.0;
    editButton.layer.cornerRadius = 24.0;
    editButton.layer.masksToBounds = YES;
    UIView *parent = editButton.superview;
    [parent.layer insertSublayer:shadowLayer below:editButton.layer];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"restSegue"]) {
        HMoveCounterViewController *viewController = [segue destinationViewController];
        setCount += 1;
        
        rest = [[jsonData valueForKeyPath:[NSString stringWithFormat:@"Set%d.Rest", setCount]] intValue];
        NSString *nextExercise = [jsonData valueForKeyPath:[NSString stringWithFormat:@"Set%d.Exercise", setCount]];
        int nextReps = [[jsonData valueForKeyPath:[NSString stringWithFormat:@"Set%d.Reps", setCount]] intValue];
        int nextWeight = [[jsonData valueForKeyPath:[NSString stringWithFormat:@"Set%d.Weight", setCount]] intValue];
        
        [viewController setSeconds:rest];
        [viewController setBadSets:badSets];
        [viewController setGoodSets:goodSets];
        [viewController setJsonData:jsonData];
        [viewController setSetCount:setCount];
        
        [viewController setNextExercise:nextExercise];
        [viewController setNextReps:nextReps];
        
        [viewController setNextWeight:nextWeight];
    }
   
    
}

//get the data from the url
-(void)getData
{
    if (jsonData == nil) {
        //get data for the table
        NSURL *dataUrl = [NSURL URLWithString:url];
        NSData *data = [NSData dataWithContentsOfURL:dataUrl];
        if (data == nil){
            NSLog(@"%@", dataUrl);
            NSLog(@"%@", data);
            NSLog(@"Error with data");
        } else {
        jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                   options:0
                                                     error:NULL];
        }
    }
    NSLog(@"%@", jsonData);
}

#pragma mark - Table Stuff

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //count how many items in the data dictionary
    double tableHeight = jsonData.count * 56;
    
    double tableMaxHeight = [UIScreen mainScreen].bounds.size.height - 62;
    if (tableHeight > tableMaxHeight) {
        NSLog(@"Don't show bottom");
    } else {
        NSLog(@"Show bottom");
    }
    return jsonData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //custom UI stuff for the table
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    self.tableView.separatorColor = [UIColor clearColor];
    //doesn't allow row to become grey on click
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //custom font
    UIFont *small = [UIFont fontWithName:@"Roboto-Regular" size:12.0];
    UIFont *regular = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    
    //variable to create strings to query dictionary for values
    long indexPlusOne = (indexPath.row)+ 1;
    NSString *indexCountString = [@(indexPlusOne) stringValue];


    //custom stuff for the labels in the table
        //assign exercise names and header to the label with that tag number
        UILabel *exerciseHeader = (UILabel *)[cell viewWithTag:1];
        exerciseHeader.font = small;
        UILabel *exercise = (UILabel *)[cell viewWithTag:2];
        exercise.font = regular;
        NSMutableString *exerciseKey = [NSMutableString stringWithFormat:@"Set%@.Exercise", indexCountString];
        exercise.text = [jsonData valueForKeyPath:exerciseKey];

    
        //assign rep count to label with that tag number
        UILabel *repsHeader = (UILabel *)[cell viewWithTag:3];
        repsHeader.font = small;
        UILabel *reps = (UILabel *)[cell viewWithTag:4];
        reps.font = regular;
        NSMutableString *repsKey = [NSMutableString stringWithFormat:@"Set%@.Reps", indexCountString];
        reps.text = [[jsonData valueForKeyPath:repsKey] stringValue];

        //assign weight amount to label with that tag number
        UILabel *weightHeader = (UILabel *)[cell viewWithTag:5];
        weightHeader.font = small;
        UILabel *weight = (UILabel *)[cell viewWithTag:6];
        weight.font = regular;
        NSMutableString *weightKey = [NSMutableString stringWithFormat:@"Set%@.Weight", indexCountString];
        weight.text = [[jsonData valueForKeyPath:weightKey] stringValue];

    
    NSNumber *rowNumber = [NSNumber numberWithLong:indexPath.row];
    

    
    
    //buttons to determine if set was good or bad
    
    //assign names for the buttons
    UIButton *goodSet = (UIButton *)[cell viewWithTag:12];
    UIButton *badSet = (UIButton *)[cell viewWithTag:11];
    
    //check if that set has been done and if it was a good set or bad set
    if([goodSets containsObject:rowNumber]){
        //hide the bad set buttons
        badSet.hidden = YES;
        //disable the good set buttons
        goodSet.enabled = NO;
        //image for a button of a set thats done and disabled
        UIImage *goodSetDone = [UIImage imageNamed:@"goodSetDone"];
        [goodSet setBackgroundImage:goodSetDone forState:UIControlStateDisabled];
        
        //set background color for that row
        cell.backgroundColor = [UIColor colorWithRed:1.0 green:0.92 blue:0.23 alpha:1.0];
    }
    
    if([badSets containsObject:rowNumber]){
        //hide the good set buttons
        goodSet.hidden = YES;
        //disable the bad set buttons
        badSet.enabled = NO;
        //image for a button of a set that is done and disabled
        UIImage *badSetDone = [UIImage imageNamed:@"badSetDone"];
        [badSet setBackgroundImage:badSetDone forState:UIControlStateDisabled];
        
        //set background color for that row
        cell.backgroundColor = [UIColor colorWithRed:1.0 green:0.92 blue:0.23 alpha:1.0];
    }
    
    //check to see what set we are on and then hide buttons for any set above that
    if (indexPath.row > setCount){
        //hide both buttons if not to that set yet
        goodSet.hidden = YES;
        badSet.hidden = YES;
    }
    //functions to do UI elements when selected
    [goodSet addTarget:self action:@selector(touchedGood:) forControlEvents:UIControlEventTouchUpInside];
    [badSet addTarget:self action:@selector(touchedBad:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(UITableViewCell *)containingCellForView:(UIView *)view
{
    //function gets what cell the message is coming from
    if (!view.superview) {
        return nil;
    }
    
    if ([view.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)view.superview;
    }
    
    return [self containingCellForView:view.superview];
}

#pragma mark - Actions for good vs bad set

-(IBAction)touchedGood:(id)sender
{
    UITableViewCell *containingCell = [self containingCellForView:sender];
    if (containingCell) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:containingCell];
        NSNumber *cellNumber = [NSNumber numberWithLong:indexPath.row];
        //insert the set number into good sets
        [goodSets insertObject:cellNumber atIndex:0];
        if ([goodSets containsObject:cellNumber]) {
            
            
            //get the cell number and make color yellow
            UIColor *yellow = [UIColor colorWithRed:1.0 green:0.92 blue:0.23 alpha:1.0];
            UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
            
            //set the color of the cell to yellow before seguing
            [self setCellColor:yellow forCell:cell withTag:[NSNumber numberWithInt:11]];
            
            //segue to rest view controller
            [self performSegueWithIdentifier:@"restSegue" sender:self];
            
            
        }
    }
}

-(IBAction)touchedBad:(id)sender
{
    UITableViewCell *containingCell = [self containingCellForView:sender];
    if (containingCell) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:containingCell];
        NSNumber *cellNumber = [NSNumber numberWithLong:indexPath.row];
        
        //insert the set number into bad sets
        [badSets insertObject:cellNumber atIndex:0];
        if ([badSets containsObject:cellNumber]) {
            
            //create color yellow and get cell number
            UIColor *yellow = [UIColor colorWithRed:1.0 green:0.92 blue:0.23 alpha:1.0];
            UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
            
            //set background for cell to yellow
            [self setCellColor:yellow forCell:cell withTag:[NSNumber numberWithInt:12]];
            
            //update set count
            setCount += 1;
            
            //get the cell that needs to be changed
            //next cell index path
            NSIndexPath *nextPath = [NSIndexPath indexPathForRow:setCount inSection:0];
           
            UITableViewCell *nextCell = (UITableViewCell *)[tableView cellForRowAtIndexPath:nextPath];
            //buttons for the next cell
            UIButton *badSet = (UIButton *)[nextCell viewWithTag:11];
            UIButton *goodSet = (UIButton *)[nextCell viewWithTag:12];
            badSet.hidden = NO;
            goodSet.hidden = NO;
        }
    }
}


//set cell colors
-(void)setCellColor:(UIColor *)color forCell:(UITableViewCell *)cell withTag:(NSNumber *)tag
{
    NSInteger tagNumber = [tag integerValue];
    if (tagNumber == 11) {
        UIButton *buttonShown = (UIButton *)[cell viewWithTag:12];
        [buttonShown setBackgroundImage:[UIImage imageNamed:@"goodSetDone"] forState:UIControlStateNormal];
    } else if (tagNumber == 12){
        UIButton *buttonShown = (UIButton *)[cell viewWithTag:11];
        [buttonShown setBackgroundImage:[UIImage imageNamed:@"badSetDone"] forState:UIControlStateNormal];
    }
    UIButton *buttonHide = (UIButton *)[cell viewWithTag:tagNumber];
    buttonHide.hidden = YES;
    cell.contentView.backgroundColor = color;
    cell.backgroundColor = color;
}


#pragma mark - side bar stuff

-(void)navBar
{
    UIColor *white = [UIColor colorWithRed:1.0
                                     green:1.0
                                      blue:1.0
                                     alpha:1.0];
    
    UIColor *grey = [UIColor colorWithRed:0.38
                                    green:0.38
                                     blue:0.38
                                    alpha:1.0];
    
    UIFont *large = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    navSidebar.backgroundColor = white;
    navHomeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    navCalenderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    navCalenderButton.titleLabel.font = large;
    navLabel.font = large;
    navLabel.textColor = grey;
    navHomeButton.titleLabel.font = large;
    
    signOutButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    navSidebar.layer.zPosition = 1;
    signOutButton.titleLabel.font = large;
    
    
}

-(void)slide
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    
    CGRect frame = navSidebar.frame;
    //frame.origin.x = 0;
    if(frame.origin.x == 0){
        frame.origin.x = -168;
        [self hideMenuShadow:navSidebar];
    } else {
        frame.origin.x = 0;
        [self styleMenu:navSidebar];
    }
    
    navSidebar.frame = frame;
    [UIView commitAnimations];
}

//shadow for the menu
-(void)styleMenu:(UIView*)view
{
    //apply shadow to FAB by adding a layer beneth it
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:navSidebar.bounds];
    navSidebar.layer.masksToBounds = NO;
    navSidebar.layer.shadowColor = [UIColor blackColor].CGColor;
    navSidebar.layer.shadowOffset = CGSizeMake(6.0, 0.0);
    navSidebar.layer.shadowOpacity = 0.24f;
    navSidebar.layer.shadowPath = shadowPath.CGPath;
    
}

-(void)hideMenuShadow:(UIView*)view
{
    navSidebar.layer.shadowOpacity = 0.0f;
}

- (IBAction)openSideBar:(id)sender {
    [self slide];
}

@end
