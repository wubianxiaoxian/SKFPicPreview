//
//  SKFPreViewNavController.m
//  SKFPicPreview
//
//  Created by 孙凯峰 on 2017/3/15.
//  Copyright © 2017年 wubianxiaoxian. All rights reserved.
//

#import "SKFPreViewNavController.h"
#import "UIView+layoutnew.h"
//#import "NewTZPreviewController.h"
#import "SKFPicPreViewController.h"

@interface SKFPreViewNavController ()
{
    
    UIStatusBarStyle _originStatusBarStyle;
}

@end

@implementation SKFPreViewNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.translucent = YES;
    UIBarButtonItem *barItem;
    if (iOS9Later) {
        barItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[SKFPreViewNavController class]]];
    } else {
        barItem = [UIBarButtonItem appearanceWhenContainedIn:[SKFPreViewNavController class], nil];
    }
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [barItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _originStatusBarStyle = [UIApplication sharedApplication].statusBarStyle;
    [UIApplication sharedApplication].statusBarStyle = iOS7Later ? UIStatusBarStyleLightContent : UIStatusBarStyleBlackOpaque;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = _originStatusBarStyle;
}


/// This init method just for previewing photos / 用这个初始化方法以预览图片
- (instancetype)initWithSelectedPhotos:(NSMutableArray *)selectedPhotos index:(NSInteger)index DeletePic:(BOOL)isDeletePic{
    SKFPicPreViewController *SKFPicPre=[[SKFPicPreViewController alloc]init];
    self = [super initWithRootViewController:SKFPicPre];
    if (self) {
        if (isDeletePic) {
            SKFPicPre.SKFPicisDelete=YES;
        }
        SKFPicPre.SKFPiccurrentIndex = index;
        SKFPicPre.IsNative=YES;
        SKFPicPre.photos = [NSMutableArray arrayWithArray:selectedPhotos];
        __weak typeof(self) weakSelf = self;
        [SKFPicPre setOkButtonClickBlockWithPreviewType:^(NSArray<UIImage *> *photos) {
            if (weakSelf.didFinishDeletePic) {
                weakSelf.didFinishDeletePic(photos);
            }
            
        }];
    }
    
    return self;
}
- (instancetype)initWithSelectedPhotoURLs:(NSMutableArray *)selectedPhotourls index:(NSInteger)index{
    SKFPicPreViewController *SKFPicPre=[[SKFPicPreViewController alloc]init];
    self = [super initWithRootViewController:SKFPicPre];
    if (self) {
        SKFPicPre.SKFPiccurrentIndex = index;
        SKFPicPre.IsNative=NO;
        SKFPicPre.photos = [NSMutableArray arrayWithArray:selectedPhotourls];

    }
    
    return self;
}




@end


@implementation UIImage (MyBundle)

+ (UIImage *)imageNamedFromMyBundle:(NSString *)name {
    UIImage *image = [UIImage imageNamed:[@"SKFPicPreview.bundle" stringByAppendingPathComponent:name]];
    if (image) {
        return image;
    } else {
        image = [UIImage imageNamed:[@"Frameworks/SKFPicPreview.framework/SKFPicPreview.bundle" stringByAppendingPathComponent:name]];
        return image;
    }
}


@end
