//
//  SKFPicPreViewController.h
//  SKFPicPreview
//
//  Created by 孙凯峰 on 2017/3/15.
//  Copyright © 2017年 wubianxiaoxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKFPicPreViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *photos;                  ///< All photos  / 所有图片数组
@property (nonatomic, assign) NSInteger SKFPiccurrentIndex;           ///< Index of the photo user click / 用户点击的图片的索引
@property(nonatomic,assign) BOOL SKFPicisDelete;
@property(nonatomic,strong)  NSMutableArray *photosTemp;


@property (nonatomic, assign) BOOL IsNative;       /// yes，加载本地图片，no，加载网络图片
/// Return the new selected photos / 返回最新的选中图片数组
@property (nonatomic, copy) void (^okButtonClickBlockWithPreviewType)(NSArray<UIImage *> *photos);
@end
