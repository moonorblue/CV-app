//
//  AboutViewController.m
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//
#define ROUND_BUTTON_WIDTH_HEIGHT 100
#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithImg:self.profileImg];
//    [self initSkillVC];
    [self initExpVC];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)initSkillVC {
//    skillVC = [self.storyboard instantiateViewControllerWithIdentifier:@"skill"];
//    skillVC.profileImg = self.profileImg;
//}
-(void)initExpVC {
    expVC = [self.storyboard instantiateViewControllerWithIdentifier:@"exp"];
    expVC.profileImg = self.profileImg;
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

- (IBAction)nextPress:(id)sender {
    expVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:expVC animated:YES completion:nil];
}
- (IBAction)backPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
