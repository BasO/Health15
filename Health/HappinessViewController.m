//
//  HappinessViewController.m
//  Health
//
//  Created by Bas Oppenheim on 09-01-15.
//  Copyright (c) 2015 Bas Oppenheim. All rights reserved.
//

#import "HappinessViewController.h"

@interface HappinessViewController ()

@end

@implementation HappinessViewController

NSDateFormatter* timeFormat;

@synthesize pageIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // somehow have to do this for the position of timeLabel to work
    timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm"];
    self.timeLabel.text = [timeFormat stringFromDate:[NSDate date]];
    
    self.timeLabel.hidden = YES;
    
    // Do any additional setup after loading the view.
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
- (IBAction)feelingsButtonPressed:(id)sender {
    [self showTimeForButton:sender];
}


- (void)showTimeForButton:(UIButton*)button
{
    // show current time in timeLabel
    timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm"];
    self.timeLabel.text = [timeFormat stringFromDate:[NSDate date]];
    
    // set correct position of timeLabel
    [self.timeLabel setCenter:CGPointMake(button.frame.origin.x - 30, button.center.y)];
    NSLog(@"button y is %f", button.frame.origin.x - 30);
    
    self.timeLabel.hidden = NO;
    self.timeLabel.alpha = 1;
    
    // animate timeLabel
    [UIView animateWithDuration:1
                          delay:0
                        options: UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         self.timeLabel.alpha = 0.4;
                         NSLog(@"2 y is %f", self.timeLabel.frame.origin.y);
                         self.timeLabel.center = CGPointMake(self.view.frame.origin.x + 50, button.center.y);
                         
                     }
                     completion:^(BOOL finished) {
                         if (self.timeLabel.alpha <= 0.1)
                             self.timeLabel.hidden = YES;
                     }];
    
}


@end
