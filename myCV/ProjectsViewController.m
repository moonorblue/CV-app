//
//  ProjectsViewController.m
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//
#define ROUND_BUTTON_WIDTH_HEIGHT 100
#import "ProjectsViewController.h"
#import "ProjectContentViewController.h"
#import "MyCollectionViewCell.h"
#import "ProjectObj.h"
@interface ProjectsViewController ()

@end

@implementation ProjectsViewController

- (void)viewWillAppear:(BOOL)animated{
    [self initCollectionArray];
    [self setVideoDic];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithImg:self.profileImg];
//    [self initCollectionArray];
//    [self initCollectionView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setVideoDic{
    videoDic = [[NSMutableDictionary alloc]init];
    [videoDic setObject:@"uvapp" forKey:@"UVAPP"];
    [videoDic setObject:@"date" forKey:@"日期拍照"];
}
#pragma mark CollectionView
-(void)initCollectionArray {
    collectionArray = [[NSMutableArray alloc]init];
    
    [collectionArray addObject:[self getProjectObjWithName:@"好解說\n-資料更新模組"
                                                    andImg:[UIImage imageNamed:@"1.jpg"]
                                                 withVideo:NO
                                            andDescription:@"使用AFNetworking開發資料更新模組，處理包含文字、壓縮檔、圖片以及影片。包含前景更新模式以及背景更新模式"]];
    [collectionArray addObject:[self getProjectObjWithName:@"好解說-工具書"
                                                    andImg:[UIImage imageNamed:@"2.jpg"]
                                                 withVideo:NO
                                            andDescription:@"使用Couchbase lite for iOS作為資料存儲。使用者可依據不同商品，新增用來解說用的工具書（投影片），可以新增照片、影片。"]];
    [collectionArray addObject:[self getProjectObjWithName:@"UVAPP"
                                                    andImg:[UIImage imageNamed:@"3.png"]
                                                 withVideo:YES
                                            andDescription:@"UI Implementation"]];
    [collectionArray addObject:[self getProjectObjWithName:@"日期拍照"
                                                    andImg:[UIImage imageNamed:@"5.png"]
                                                 withVideo:YES
                                            andDescription:@"將照片加上可選擇的日期標籤，照片透過Dropbox自動同步"]];
    [collectionArray addObject:[self getProjectObjWithName:@"BEAUTER"
                                                    andImg:[UIImage imageNamed:@"4.png"]
                                                 withVideo:NO
                                            andDescription:@"清華大學創業課程作品，提供穿著打扮穿搭建議：使用app傳送需求，後端回覆後提供穿搭建議"]];
    [collectionArray addObject:[self getProjectObjWithName:@"WIFI AUTO"
                                                    andImg:[UIImage imageNamed:@"6.png"]
                                                 withVideo:NO
                                            andDescription:@"自動登入交通大學無線網路認證網頁"]];
    [collectionArray addObject:[self getProjectObjWithName:@"Bacteria"
                                                    andImg:[UIImage imageNamed:@"7.png"]
                                                 withVideo:NO
                                            andDescription:@"清華大學OBJECTIVE C開發課程成果，使用COCOS2D進行遊戲開發 "]];
    
    [self initCollectionView];
    
}

-(ProjectObj*)getProjectObjWithName:(NSString*)name andImg:(UIImage*)img withVideo:(BOOL)withVideo andDescription:(NSString*)des{

    ProjectObj *obj = [[ProjectObj alloc]init];
    obj.name = name;
    obj.img = img;
    obj.hasVideo = withVideo;
    obj.des = des;
    
    return obj;
}
-(void)initCollectionView{
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    self.collectionView.bounces = YES;
    self.collectionView.alwaysBounceHorizontal = NO;
    self.collectionView.alwaysBounceVertical=NO;
    self.collectionView.delegate = self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    NSLog(@"%ld",[collectionArray count]);
    return [collectionArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    //    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.Img.contentMode = UIViewContentModeScaleAspectFit;
    UIView* selectedBGView = [[UIView alloc] initWithFrame:cell.bounds];
    selectedBGView.backgroundColor = [UIColor lightGrayColor];
    cell.selectedBackgroundView = selectedBGView;
    if([collectionArray count] > 0){
        ProjectObj *obj = [collectionArray objectAtIndex:indexPath.row];
        cell.Img.image = obj.img;
        cell.NameLabel.text = obj.name;
//        NSLog(@"%@",obj.name);
//        NSLog(@"%@",cell.NameLabel.text);
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    ProjectObj *obj = [collectionArray objectAtIndex:indexPath.row];
    
    ProjectContentViewController *contentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"content"];
    contentVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [contentVC initDataWithProjectObj:obj];
    if (obj.hasVideo == YES) {
        contentVC.fileURL = [videoDic objectForKey:obj.name];
        NSLog(contentVC.fileURL);
    }
    [self presentViewController:contentVC animated:YES completion:nil];
//    NSLog(@"%@",obj.name);
    
//    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    self.booksArray = [[defaults objectForKey:@"myBooks"] mutableCopy];
//    
//    if (self.delete == NO) {
//        delegate.bookID = [self.booksNameArray objectAtIndex:indexPath.row];
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        SlideContentViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//        viewController.tag = 1;
//        [self.navigationController pushViewController:viewController animated:YES];
//    }
//    else{
//        [self.selectedBooks addObject:[self.booksNameArray objectAtIndex:indexPath.row]];
//        if ([self.selectedBooks count] > 0) {
//            self.rightBarBUtton.enabled = YES;
//        }
//        else{
//            self.rightBarBUtton.enabled = NO;
//        }
    
        
//        NSLog(@"selectbook: %@",self.selectedBooks);
//    }
    
}


- (void)initWithImg:(UIImage*)img{
    //    self.imgView.image = [UIImage imageNamed:@"profileSquare"];
    self.imgView.image = img;
    self.imgView.frame = CGRectMake(62.5, 82.2, ROUND_BUTTON_WIDTH_HEIGHT, ROUND_BUTTON_WIDTH_HEIGHT);
    
    //Clip/Clear the other pieces whichever outside the rounded corner
    self.imgView.clipsToBounds = YES;
    
    //half of the width
    self.imgView.layer.cornerRadius = ROUND_BUTTON_WIDTH_HEIGHT/2.0f;
    self.imgView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.imgView.layer.borderWidth=1.0f;
}
- (IBAction)backPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
