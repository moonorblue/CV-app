//
//  ProjectObj.h
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ProjectObj : NSObject
@property (strong)NSString* name;
@property (strong)NSString* des;
@property (strong)UIImage *img;
@property BOOL hasVideo;
@end
