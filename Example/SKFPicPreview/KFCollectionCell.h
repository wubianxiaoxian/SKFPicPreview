//
//  KFCollectionCell.h
//  SKFPicturePikerDemo
//
//  Created by 孙凯峰 on 2017/2/14.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *KFCellimageView;
@property (nonatomic, strong) UIButton *KFCellDeleteButton;
@property (nonatomic, assign) NSInteger KFCellrow;
- (UIView *)KFCellsnapshotView;
@end
