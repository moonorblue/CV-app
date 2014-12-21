//
//  SkillsViewController.m
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//
#define ROUND_BUTTON_WIDTH_HEIGHT 100
#import "SkillsViewController.h"

@interface SkillsViewController ()

@end

@implementation SkillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithImg:self.profileImg];
    [self initProjectVC];
    // Do any additional setup after loading the view.
}
-(void)initProjectVC {
    pjVC = [self.storyboard instantiateViewControllerWithIdentifier:@"project"];
    pjVC.profileImg = self.profileImg;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)nextPress:(id)sender {
    pjVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:pjVC animated:YES completion:nil];
}

- (void)initWithImg:(UIImage*)img{
    //    self.imgView.image = [UIImage imageNamed:@"profileSquare"];
    self.imgView.image = img;
    self.imgView.frame = CGRectMake(62.5, 82.2, ROUND_BUTTON_WIDTH_HEIGHT, ROUND_BUTTON_WIDTH_HEIGHT);
    
    //Clip/Clear the other pieces whichever outside the rounded corner
    self.imgView.clipsToBounds = YES;
    
    //half of the width
    self.imgView.layer.cornerRadius = ROUND_BUTTON_WIDTH_HEIGHT/2.0f;
    self.imgView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.imgView.layer.borderWidth=1.0f;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
