//
//  SkillsViewController.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectsViewController.h"
@interface SkillsViewController : UIViewController{
    ProjectsViewController *pjVC;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (strong)UIImage* profileImg;
- (IBAction)backPress:(id)sender;
- (IBAction)nextPress:(id)sender;
- (void)initWithImg:(UIImage*)img;
@end
