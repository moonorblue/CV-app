//
//  ViewController.m
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//


//#define ROUND_BUTTON_WIDTH_HEIGHT 200

#import "ViewController.h"
#import "CameraViewController.h"
#import "AboutViewController.h"
#import "ProjectsViewController.h"
#import "SkillsViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CameraViewController *cameraVC = [self.storyboard instantiateViewControllerWithIdentifier:@"camera"];
    [self addChildViewController:cameraVC];
    [self.view addSubview:cameraVC.view];
//    [self initVCData];
//    [self initPageVC];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initPageVC {
//    self.pageViewController = [self.storyboardinstantiateViewControllerWithIdentifier:@"PageVC"];
//    self.pageViewController.dataSource = self;
    self.pageViewController = [[UIPageViewController alloc]init];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
    [self.view insertSubview:self.pageViewController.view atIndex:100];
    
    nowIdx = 0;
    
    for (UIGestureRecognizer *recognizer in self.pageViewController.gestureRecognizers) {
//        recognizer.enabled = NO;
        NSLog(recognizer.description);
    }
    [self nextPage];
}

- (void)initVCData {
    
    VCArray = [[NSArray alloc]initWithObjects:@"camera",@"about",@"skill",@"project", nil];
    VCDic = [[NSMutableDictionary alloc] init];

    
    CameraViewController *cameraVC = [[CameraViewController alloc]init];
    AboutViewController *aboutVC = [[AboutViewController alloc]init];
    SkillsViewController *skillVC = [[SkillsViewController alloc]init];
    ProjectsViewController *projectVC = [[ProjectsViewController alloc]init];
    
    [VCDic setObject:cameraVC forKey:@"camera"];
    [VCDic setObject:aboutVC forKey:@"about"];
    [VCDic setObject:skillVC forKey:@"skill"];
    [VCDic setObject:projectVC forKey:@"project"];
    
    
    count = [VCArray count];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIViewController *)getObjectPageAtIndex:(int)index
{
    
    NSString *VCName = [VCArray objectAtIndex:index];
//    UIViewController *vc = (UIViewController*) [VCDic objectForKey:VCName];
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:VCName];
    return vc;
//    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    bookID = delegate.bookID;
//    CBLDocument* doc = [delegate.database existingDocumentWithID:bookID];
//    NSMutableDictionary *docContent = [doc.properties mutableCopy];
//    NSMutableArray *objectDict = [docContent objectForKey:@"objects"];
//    objectCount = [objectDict count];
//    
//    if (objectCount>0)
//    {
//        UIViewController *vc = nil;
//        NSDictionary *dict = [objectDict objectAtIndex:index];
//        
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        if ([[dict objectForKey:@"objectType"] isEqualToString:@"image"])
//        {
//            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageVC"];
//            [defaults setObject:[[dict objectForKey:@"objectData"] base64DecodedData] forKey:@"showImage"];
//        }
//        else if ([[dict objectForKey:@"objectType"] isEqualToString:@"video"])
//        {
//            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoVC"];
//            [defaults setObject:[dict objectForKey:@"objectPath"] forKey:@"showVideo"];
//        }
//        //    else if ([[dict objectForKey:@"objectType"] isEqualToString:@"web"])
//        //    {
//        //      vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WebVC"];
//        //      [defaults setObject:[dict objectForKey:@"objectPath"] forKey:@"showWeb"];
//        //    }
//        return vc;
////    }
////    return nil;
//    UIViewController *vc = nil;
//    vc = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutVC"];
    
}

- (void) nextPage
{
    
    UIViewController *vc = [self getObjectPageAtIndex:(int)nowIdx];
    
    if (vc != nil) {
        nowIdx++;
        NSArray *viewControllers = @[vc];
        [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
    }
}


@end
