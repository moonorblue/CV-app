//
//  CameraViewController.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AboutViewController.h"
@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIButton *button;
    AboutViewController *aboutVC;
    UIImage *myImg;
}

@property (weak, nonatomic) IBOutlet UIImageView *overLayView;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel2;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel3;
@property (weak, nonatomic) IBOutlet UIButton *nextBut;

-(void)roundButtonDidTap:(UIButton*)tappedButton;
- (IBAction)nextPress:(id)sender;

@end
