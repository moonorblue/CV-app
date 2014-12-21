//
//  ProjectContentViewController.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectObj.h"
#import <MediaPlayer/MediaPlayer.h>
@interface ProjectContentViewController : UIViewController{
    UIImage *img;
    NSString *name;
    NSString *des;
    BOOL hasVideo;
    
}
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *DesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *demoButton;
- (IBAction)demoPress:(id)sender;
@property (strong,atomic)ProjectObj* pObj;
- (IBAction)backPress:(id)sender;
- (void)initDataWithProjectObj:(ProjectObj*)obj;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
- (IBAction)playMovie:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (strong,atomic)NSString *fileURL;
@end
