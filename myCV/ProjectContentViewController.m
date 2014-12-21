//
//  ProjectContentViewController.m
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import "ProjectContentViewController.h"

@interface ProjectContentViewController ()

@end

@implementation ProjectContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAll];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)initDataWithProjectObj:(ProjectObj*)obj{
    self.pObj = obj;
    img = self.pObj.img;
    name = self.pObj.name;
    des = self.pObj.des;
    hasVideo = self.pObj.hasVideo;
    
}

- (void)setAll {
    self.NameLabel.text = name;
    self.DesLabel.text = des;
    self.imgView.image = img;
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.backButton.transform = CGAffineTransformMakeRotation(-90*M_PI/180);
    if (hasVideo == YES) {
        self.demoButton.hidden = NO;

    }
    else {
        self.demoButton.hidden = YES;
    }
//    self.imgView.layer.borderColor = [UIColor grayColor].CGColor;
//    self.imgView.layer.borderWidth = 2.0f;
}


-(void)playMovie:(id)sender
{
    NSString *videoUrl = self.fileURL;
    NSLog(videoUrl);
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:videoUrl ofType:@"mov"]];
//    NSURL *url = [NSURL URLWithString:
//                  videoUrl];
    
    self.moviePlayer =  [[MPMoviePlayerController alloc]
                     initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.moviePlayer];
    
    self.moviePlayer.controlStyle = MPMovieControlStyleDefault;
    self.moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer setFullscreen:YES animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}
- (IBAction)demoPress:(id)sender {
}
@end
