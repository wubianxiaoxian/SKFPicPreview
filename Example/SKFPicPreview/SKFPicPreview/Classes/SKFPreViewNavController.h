//
//  SKFPreViewNavController.h
//  SKFPicPreview
//
//  Created by 孙凯峰 on 2017/3/15.
//  Copyright © 2017年 wubianxiaoxian. All rights reserved.
//

#import <UIKit/UIKit.h>
#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)

@interface SKFPreViewNavController : UINavigationController

/// This init method just for previewing photos / 用这个初始化方法以预览本地图片
- (instancetype)initWithSelectedPhotos:(NSMutableArray *)selectedPhotos index:(NSInteger)index DeletePic:(BOOL)isDeletePic;

/// This init method just for previewing photos / 用这个初始化方法以预览网络图片
- (instancetype)initWithSelectedPhotoURLs:(NSMutableArray *)selectedPhotourls index:(NSInteger)index;



@property (nonatomic, copy) void (^didFinishDeletePic)(NSArray<UIImage *> *photos);

@end


@interface UIImage (MyBundle)

+ (UIImage *)imageNamedFromMyBundle:(NSString *)name;

@end

