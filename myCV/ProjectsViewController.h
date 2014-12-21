//
//  ProjectsViewController.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectsViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    NSMutableArray *collectionArray;
    NSMutableDictionary *videoDic;

}
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)backPress:(id)sender;
@property (strong)UIImage* profileImg;
@end
