//
//  SKFPreviweCell.h
//  SKFPicPreview
//
//  Created by 孙凯峰 on 2017/3/16.
//  Copyright © 2017年 wubianxiaoxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKFPreviweCell : UICollectionViewCell
-(void)setKImageView:(UIImage *)image;
-(void)setKNativeImageview:(UIImage *)image;
@property (nonatomic, copy) void (^singleTapGestureBlock)();
@end
