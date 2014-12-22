//
//  ExpViewController.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/22.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkillsViewController.h"
@interface ExpViewController : UIViewController{
    SkillsViewController *skillVC;
}
- (IBAction)nextPress:(id)sender;
- (IBAction)backPress:(id)sender;
@property (strong)UIImage* profileImg;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
