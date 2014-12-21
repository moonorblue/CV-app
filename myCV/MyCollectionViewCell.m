//
//  MyCollectionViewCell.m
//  myCV
//
//  Created by KaeJer Cho on 2014/12/21.
//  Copyright (c) 2014年 KaeJer Cho. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"MyCollectionViewCell" owner:self options:nil];
        
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
    }
    return self;
}
//- (void)awakeFromNib {
//    self.Img.contentMode = UIViewContentModeCenter;
//    // Initialization code
//}

@end
