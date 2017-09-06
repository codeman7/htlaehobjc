//
//  HMoveCalenderViewController.m
//  Htlaeh
//
//  Created by Cody Weaver on 1/31/15.
//  Copyright (c) 2015 Cody Weaver. All rights reserved.
//

#import "HMoveCalenderViewController.h"
#define url @"http://tidy-bliss-523.appspot.com/cal"

@interface HMoveCalenderViewController ()

@end

@implementation HMoveCalenderViewController

@synthesize pageNav, topView, bottomView, largeDay, largeMonth, largeYear, monthText, dayText, yearText, bottomCenterView, cancelButton, okButton, monthYearSmall, sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel, thursdayLabel, fridayLabel, saturdayLabel, rowOneColOne, rowOneColTwo, rowOneColThr, rowOneColFou, rowOneColFiv, rowOneColSix, rowOneColSev, rowTwoColOne, rowTwoColTwo, rowTwoColThr, rowTwoColFou, rowTwoColFiv, rowTwoColSix, rowTwoColSev, rowThrColOne, rowThrColTwo, rowThrColThr, rowThrColFou, rowThrColFiv, rowThrColSix, rowThrColSev, rowFouColOne, rowFouColTwo, rowFouColThr, rowFouColFou, rowFouColFiv, rowFouColSix, rowFouColSev, rowFivColOne, rowFivColTwo, rowFivColThr, rowFivColFou, rowFivColFiv, rowFivColSix, rowFivColSev, rowSixColOne, rowSixColTwo, rowSixColThr, rowSixColFou, rowSixColFiv, rowSixColSix, rowSixColSev, calendarButtons, calenderNumbers, menuButton, pageLabel, lastVC, month, menuView, workoutData, homeButton, calenderButton, signOutButton, htlaehName, days, user;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getData];
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
    if ([[segue identifier] isEqualToString:@"calToEdit"]) {
        HMoveEditViewController *viewController = [segue destinationViewController];
        [viewController setDay:[largeDay.text longLongValue]];
        [viewController setMonth:month];
        [viewController setYear:[largeYear.text longLongValue]];
        [viewController setWorkoutData:workoutData];
    } else if ([[segue identifier] isEqualToString:@"calToView"]){
        HMoveViewViewController *viewController = [segue destinationViewController];
        [viewController setDay:[largeDay.text longLongValue]];
        [viewController setMonth:month];
        [viewController setYear:[largeYear.text longLongValue]];
    }
}


-(void)customLoad
{
    [self initiateArray];
    if ([lastVC isEqualToString:@"Home"]) {
        [self topViewMethod:1];
    } else if ([lastVC isEqualToString:@"Edit"]){
        [self topViewMethod:2];
    } else{
        [self topViewMethod:0];
    }
    [self bottomViewMethod];
    [self menu];
}

-(void)initiateArray
{
    calendarButtons = [[NSMutableArray alloc] init];
    [calendarButtons addObject:rowOneColOne];
    [calendarButtons addObject:rowOneColTwo];
    [calendarButtons addObject:rowOneColThr];
    [calendarButtons addObject:rowOneColFou];
    [calendarButtons addObject:rowOneColFiv];
    [calendarButtons addObject:rowOneColSix];
    [calendarButtons addObject:rowOneColSev];
    [calendarButtons addObject:rowTwoColOne];
    [calendarButtons addObject:rowTwoColTwo];
    [calendarButtons addObject:rowTwoColThr];
    [calendarButtons addObject:rowTwoColFou];
    [calendarButtons addObject:rowTwoColFiv];
    [calendarButtons addObject:rowTwoColSix];
    [calendarButtons addObject:rowTwoColSev];
    [calendarButtons addObject:rowThrColOne];
    [calendarButtons addObject:rowThrColTwo];
    [calendarButtons addObject:rowThrColThr];
    [calendarButtons addObject:rowThrColFou];
    [calendarButtons addObject:rowThrColFiv];
    [calendarButtons addObject:rowThrColSix];
    [calendarButtons addObject:rowThrColSev];
    [calendarButtons addObject:rowFouColOne];
    [calendarButtons addObject:rowFouColTwo];
    [calendarButtons addObject:rowFouColThr];
    [calendarButtons addObject:rowFouColFou];
    [calendarButtons addObject:rowFouColFiv];
    [calendarButtons addObject:rowFouColSix];
    [calendarButtons addObject:rowFouColSev];
    [calendarButtons addObject:rowFivColOne];
    [calendarButtons addObject:rowFivColTwo];
    [calendarButtons addObject:rowFivColThr];
    [calendarButtons addObject:rowFivColFou];
    [calendarButtons addObject:rowFivColFiv];
    [calendarButtons addObject:rowFivColSix];
    [calendarButtons addObject:rowFivColSev];
    [calendarButtons addObject:rowSixColOne];
    [calendarButtons addObject:rowSixColTwo];
    [calendarButtons addObject:rowSixColThr];
    [calendarButtons addObject:rowSixColFou];
    [calendarButtons addObject:rowSixColFiv];
    [calendarButtons addObject:rowSixColSix];
    [calendarButtons addObject:rowSixColSev];
}

-(void)topViewMethod:(int)VC
{
   if (VC == 1) {
        pageLabel.text = @"Calender";
    } else if (VC == 2){
        pageLabel.text = @"Pick a date";
    }
    UIFont *regular = [UIFont fontWithName:@"Roboto-Regular" size:24.0];
    UIFont *bold = [UIFont fontWithName:@"Roboto-Regular" size:68.0];
    UIFont *big = [UIFont fontWithName:@"Roboto-Regular" size:28.0];
    UIFont *normal = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    UIColor *grey = [UIColor colorWithRed:0.91
                                    green:0.91
                                     blue:0.91
                                    alpha:1.0];
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    UIColor *white = [UIColor colorWithRed:1.0
                                     green:1.0
                                      blue:1.0
                                     alpha:1.0];
    UIColor *darkBlue = [UIColor colorWithRed:0.01
                                        green:0.61
                                         blue:0.90
                                        alpha:1.0];
    pageLabel.font = normal;
    pageLabel.textColor = white;
    pageNav.backgroundColor = blue;
    pageNav.layer.masksToBounds = NO;
    pageNav.layer.shadowColor = [UIColor blackColor].CGColor;
    pageNav.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    pageNav.layer.shadowOpacity = 0.24;
    pageNav.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    pageNav.layer.shouldRasterize = YES;
    topView.backgroundColor = darkBlue;
    largeYear.font = regular;
    largeYear.textColor = grey;
    largeDay.font = bold;
    largeDay.textColor = white;
    largeMonth.font = big;
    largeMonth.textColor = white;
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    long year = [components year];
    month = [components month];
    long day = [components day];
    
    if (month == 1) {
        monthText = @"JAN";
    } else if (month == 2){
        monthText = @"FEB";
    } else if (month == 3){
        monthText = @"MAR";
    } else if (month == 4){
        monthText = @"APR";
    } else if (month == 5){
        monthText = @"MAY";
    } else if (month == 6){
        monthText = @"JUN";
    } else if (month == 7){
        monthText = @"JUL";
    } else if (month == 8){
        monthText = @"AUG";
    } else if (month == 9){
        monthText = @"SEP";
    } else if (month == 10){
        monthText = @"OCT";
    } else if (month == 11){
        monthText = @"NOV";
    } else if (month == 12){
        monthText = @"DEC";
    } else {
        monthText = @"ERR";
    }
    
    yearText = [NSString stringWithFormat:@"%li", year];
    dayText = [NSString stringWithFormat:@"%li", day];
    
    largeMonth.text = monthText;
    largeYear.text = yearText;
    largeDay.text = dayText;
    
    
    
}

-(void)bottomViewMethod
{
    UIFont *regular = [UIFont fontWithName:@"Roboto-Regular" size:16.0];
    okButton.titleLabel.font = regular;
    cancelButton.titleLabel.font = regular;
    UIColor *white = [UIColor colorWithRed:1.0
                                     green:1.0
                                      blue:1.0
                                     alpha:1.0];
    
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    UIColor *grey = [UIColor colorWithRed:0.50
                                    green:0.50
                                     blue:0.50
                                    alpha:1.0];
    [okButton setTitleColor:blue forState:UIControlStateNormal];
    if ([lastVC isEqualToString:@"Edit"]) {
        [okButton setTitle:@"DONE" forState:UIControlStateNormal];
    }
    [cancelButton setTitleColor:blue forState:UIControlStateNormal];
    bottomView.backgroundColor = white;
    bottomCenterView.backgroundColor = white;
    sundayLabel.font = regular;
    sundayLabel.textColor = grey;
    mondayLabel.font = regular;
    mondayLabel.textColor = grey;
    tuesdayLabel.font = regular;
    tuesdayLabel.textColor = grey;
    wednesdayLabel.font = regular;
    wednesdayLabel.textColor = grey;
    thursdayLabel.font = regular;
    thursdayLabel.textColor = grey;
    fridayLabel.font = regular;
    fridayLabel.textColor = grey;
    saturdayLabel.font = regular;
    saturdayLabel.textColor = grey;
    
    NSDateComponents *componentsForMonth = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];

    month = [componentsForMonth month];
    if (month == 1) {
        monthText = @"January";
    } else if (month == 2){
        monthText = @"Febuary";
    } else if (month == 3){
        monthText = @"March";
    } else if (month == 4){
        monthText = @"April";
    } else if (month == 5){
        monthText = @"May";
    } else if (month == 6){
        monthText = @"June";
    } else if (month == 7){
        monthText = @"July";
    } else if (month == 8){
        monthText = @"August";
    } else if (month == 9){
        monthText = @"September";
    } else if (month == 10){
        monthText = @"October";
    } else if (month == 11){
        monthText = @"November";
    } else if (month == 12){
        monthText = @"December";
    } else {
        monthText = @"Error";
    }
    
    monthYearSmall.text = [NSString stringWithFormat:@"%@ %@", monthText, yearText];
    monthYearSmall.font = regular;
    monthYearSmall.textColor = [UIColor blackColor];
    
    
    NSDate *today = [NSDate date];
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorian components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:today];
    components.day = 1;
    
    
    
    
    NSDate *dayOneInCurrentMonth = [gregorian dateFromComponents:components];
    NSLog(@"%@", dayOneInCurrentMonth);
    
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"EEEE"]; // day, like "Saturday"
    
    NSString *dayOfWeek = [myFormatter stringFromDate:dayOneInCurrentMonth];
    NSLog(@"The first was: %@", dayOfWeek);
    
    
    
    

    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange daysInMonthRange = [cal rangeOfUnit:NSCalendarUnitDay
                                     inUnit:NSCalendarUnitMonth
                                    forDate:today];
    NSUInteger daysInMonthInt = daysInMonthRange.length;
    int daysInMonth = daysInMonthInt;
    if ([dayOfWeek isEqualToString:@"Sunday"]) {
        for (int i = 1; i <= daysInMonth; i++) {
            [calendarButtons[i-1] setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
            
        }
    } else if ([dayOfWeek isEqualToString:@"Monday"]){
        for (int i = 1; i <= daysInMonth; i++) {
            [calendarButtons[i] setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        }
    } else if ([dayOfWeek isEqualToString:@"Tuesday"]){
        for (int i = 1; i <= daysInMonth; i++) {
            [calendarButtons[i+1] setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        }
    } else if ([dayOfWeek isEqualToString:@"Wednesday"]){
        for (int i = 1; i <= daysInMonth; i++) {
            [calendarButtons[i+2] setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        }
    } else if ([dayOfWeek isEqualToString:@"Thursday"]){
        for (int i = 1; i <= daysInMonth; i++) {
            [calendarButtons[i+3] setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        }
    } else if ([dayOfWeek isEqualToString:@"Friday"]){
        for (int i = 1; i <= daysInMonth; i++) {
            [calendarButtons[i+4] setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        }
    } else if ([dayOfWeek isEqualToString:@"Saturday"]){
        for (int i = 1; i <= daysInMonth; i++) {
            [calendarButtons[i+5] setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        }
    }
    
    for (UIButton *buttons in calendarButtons) {
        //[buttons setTitle:@"1" forState:UIControlStateNormal];
        [buttons setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttons.titleLabel.font = regular;
        buttons.layer.cornerRadius = 18.0f;
        
        
        
    }
    [self numberCheck];
    
}

-(void)numberCheck
{
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    
    //Do work to fix array numbers should initiate with days return
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    [numbers addObject:@"7"];
    [numbers addObject:@"9"];
    for (UIButton *buttons in calendarButtons) {
        for (NSString *string in numbers) {
            if ([[buttons currentTitle] isEqualToString:string]) {
                [buttons setTitleColor:blue forState:UIControlStateNormal];
                
            } else {
                //[okButton setUserInteractionEnabled:NO];
            }
        }
    }
    
}



- (IBAction)buttonTouch:(id)sender {
    
    
    UIColor *blue = [UIColor colorWithRed:0.01
                                    green:0.66
                                     blue:0.96
                                    alpha:1.0];
    if ([sender currentTitle].length > 0) {
        for (UIButton *buttons in calendarButtons) {
            //[buttons setTitle:@"1" forState:UIControlStateNormal];
            [buttons setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [buttons setBackgroundColor:[UIColor clearColor]];
            [self numberCheck];
        }
        
        
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setBackgroundColor:blue];
        largeDay.text = [sender currentTitle];
    }
   
}
- (IBAction)okButtonAction:(id)sender {
    if ([lastVC isEqualToString:@"Edit"]) {
        NSLog(@"%ld", month);
        [self performSegueWithIdentifier:@"calToEdit" sender:self];
    } else {
        [self performSegueWithIdentifier:@"calToView" sender:self];
    }
}

- (IBAction)slideMenu:(id)sender {
    [self slide];
}


#pragma mark - Menu Stuff

-(void)menu
{
    UIColor *white = [UIColor whiteColor];
    menuView.backgroundColor = white;
    menuView.layer.zPosition = 1;
    UIColor *grey = [UIColor colorWithRed:0.38
                                    green:0.38
                                     blue:0.38
                                    alpha:1.0];
    [homeButton setTitleColor:grey forState:UIControlStateNormal];
    [calenderButton setTitleColor:grey forState:UIControlStateNormal];
    [signOutButton setTitleColor:grey forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(homeSegue) forControlEvents:UIControlEventTouchUpInside];
    [calenderButton addTarget:self action:@selector(slide) forControlEvents:UIControlEventTouchUpInside];
    htlaehName.textColor = grey;
}

-(void)homeSegue{
    NSLog(@"segue home");
    [self performSegueWithIdentifier:@"calToHome" sender:self];
}

-(void)slide
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    CGRect frame = menuView.frame;
    if (frame.origin.x == 0) {
        frame.origin.x = -256;
        [self hideMenuShadow:menuView];
    } else {
        frame.origin.x = 0;
        [self styleMenu:menuView];
        menuView.userInteractionEnabled = TRUE;
        homeButton.userInteractionEnabled = TRUE;
        topView.userInteractionEnabled = FALSE;
    }
    
    menuView.frame = frame;
    [UIView commitAnimations];
}

-(void)styleMenu:(UIView *)view
{
    //apply shadow to view adding alayer beneth it
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:menuView.bounds];
    menuView.layer.masksToBounds = NO;
    menuView.layer.shadowColor = [UIColor blackColor].CGColor;
    menuView.layer.shadowOffset = CGSizeMake(6.0, 0.0);
    menuView.layer.shadowOpacity = 0.24f;
    menuView.layer.shadowPath = shadowPath.CGPath;
    
}

-(void)hideMenuShadow:(UIView *)view
{
    menuView.layer.shadowOpacity = 0.0f;
}

-(void)security
{
    //look up value and if there is one then segue to Home
    NSString *keyToSearchFor = @"User";
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *query = @{
                            (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge id)kSecAttrService : service,
                            (__bridge id)kSecAttrAccount : keyToSearchFor,
                            (__bridge id)kSecReturnData : (__bridge id)kCFBooleanTrue,
                            };
    
    CFDataRef cfValue = NULL;
    OSStatus result = SecItemCopyMatching((__bridge CFDictionaryRef)query,
                                          (CFTypeRef *)&cfValue);
    
    
    
    if (result == errSecSuccess) {
        NSString *value = [[NSString alloc] initWithData:(__bridge_transfer NSData *)cfValue
                                                encoding:NSUTF8StringEncoding];
        user = value;
        
    } else {
        //segue to main
        NSLog(@"Error happened with code: %ld", (long)result);
    }
}

-(void)getData
{
    [self security];
    NSString *newUrl = [NSString stringWithFormat:@"%@?device=iPhone", url];
    NSURL *dataUrl = [NSURL URLWithString:newUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:dataUrl];
    NSString *userNumber = [NSString stringWithFormat:@"user=%@", user];
    NSData *requestData = [userNumber dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:requestData];
    [request setHTTPMethod:@"POST"];
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    days = [NSJSONSerialization JSONObjectWithData:data
                                           options:0
                                             error:NULL];
    
    NSLog(@"Days: %@", days);
}

@end
