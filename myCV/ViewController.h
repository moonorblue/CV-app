//
//  ViewController.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPageViewControllerDataSource>{
    
    NSArray *VCArray;
    NSMutableDictionary *VCDic;
    NSInteger nowIdx;
    NSInteger count;

}

@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

