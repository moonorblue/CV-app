//
//  CameraViewController.m
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//
#define ROUND_BUTTON_WIDTH_HEIGHT 200
#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMsgLabel];
    UIImage *defaultImg = [UIImage imageNamed:@"profileSquare.png"];
    [self initCircleButtonWithImg:defaultImg];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)roundButtonDidTap:(UIButton*)tappedButton{
    
    NSLog(@"roundButtonDidTap Method Called");
    
}

- (IBAction)nextPress:(id)sender {
    aboutVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:aboutVC animated:YES completion:nil];
}

-(void)initBackgroundView {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    bgView.backgroundColor = [UIColor whiteColor]; // 把背景設成白色
    bgView.backgroundColor = [UIColor clearColor]; // 透明背景
    bgView.layer.cornerRadius = 2.5; // 圓角的弧度
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = [[UIColor blackColor] CGColor];
    bgView.layer.shadowColor = [[UIColor blackColor] CGColor];
    bgView.layer.shadowOffset = CGSizeMake(3.0f, 3.0f); // [水平偏移, 垂直偏移]
    bgView.layer.shadowOpacity = 0.5f; // 0.0 ~ 1.0 的值
    bgView.layer.shadowRadius = 10.0f; // 陰影發散的程度
    [self.view addSubview:bgView];
}
-(void)initMsgLabel {
    self.msgLabel.font = [UIFont fontWithName:@"Shket" size:54];
    self.msgLabel.alpha = 0.0;
    self.msgLabel.textAlignment = NSTextAlignmentCenter;
    self.msgLabel.numberOfLines = 0;
    self.msgLabel.text = @"[ Cho Kae Jer ]";
    self.msgLabel.textColor = [UIColor lightGrayColor];
    
    
    self.msgLabel2.font = [UIFont fontWithName:@"Shket" size:62];
    self.msgLabel2.alpha = 0.0;
    self.msgLabel2.textAlignment = NSTextAlignmentCenter;
    self.msgLabel2.numberOfLines = 0;
    self.msgLabel2.text = @"iOS Developer";
    
    self.nextBut.alpha = 0.0;
    
    
    
    
    //    self.msgLabel.font = [UIFont fontWithName:@"Shket-Regular" size:32];
}

- (void)initCircleButtonWithImg:(UIImage*)img {
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:img forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    //width and height should be same value
    button.frame = CGRectMake(62.5, 82.2, ROUND_BUTTON_WIDTH_HEIGHT, ROUND_BUTTON_WIDTH_HEIGHT);
    
    //Clip/Clear the other pieces whichever outside the rounded corner
    button.clipsToBounds = YES;
    
    //half of the width
    button.layer.cornerRadius = ROUND_BUTTON_WIDTH_HEIGHT/2.0f;
    button.layer.borderColor=[UIColor lightGrayColor].CGColor;
    button.layer.borderWidth=1.0f;
    
    [self.view addSubview:button];
}

- (void)updateCircleButtonWithImg:(UIImage*)img {
    
    [button setImage:img forState:UIControlStateNormal];
    [button setImage:img forState:UIControlStateSelected];
}

- (IBAction)takePhoto:  (UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    
    [self presentViewController:picker animated:NO completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    UIImage *chosenImg = info[UIImagePickerControllerOriginalImage];
    CGSize imageSize = chosenImg.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    if (width != height) {
        CGFloat newDimension = MIN(width, height);
        CGFloat widthOffset = (width - newDimension) / 2;
        CGFloat heightOffset = (height - newDimension) / 2;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(newDimension, newDimension), NO, 0.);
        [chosenImg drawAtPoint:CGPointMake(-widthOffset, -heightOffset)
                     blendMode:kCGBlendModeCopy
                         alpha:1.];
        chosenImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIImage * flippedImg = [UIImage imageWithCGImage:chosenImg.CGImage scale:chosenImg.scale orientation:UIImageOrientationUpMirrored];
    
    [self updateCircleButtonWithImg:flippedImg];
    [self fadeOutAnimationWithObj:self.overLayView];
    
    aboutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"about"];
    aboutVC.profileImg = flippedImg;

    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)fadeOutAnimationWithObj:(UIView*)obj {
    [UIView animateWithDuration:2.0 animations:^{
        obj.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self labelfadeInAnimation];
        //        [self initBackgroundView];
        
    }];
}
- (void)labelfadeInAnimation{
    [UIView animateWithDuration:2.0 delay:2.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.msgLabel.alpha = 1.0;
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2.0 delay:4.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.msgLabel2.alpha = 1.0;
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.nextBut.alpha = 1.0;
            }completion:^(BOOL finished) {
                
            }];
        }];
        
    }];
}

@end
