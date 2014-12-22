//
//  AboutViewController.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkillsViewController.h"
#import "ExpViewController.h"
@interface AboutViewController : UIViewController{
//    SkillsViewController *skillVC;
    ExpViewController *expVC;
}
- (IBAction)backPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (strong)UIImage* profileImg;
- (void)initWithImg:(UIImage*)img;
- (IBAction)nextPress:(id)sender;

@end
