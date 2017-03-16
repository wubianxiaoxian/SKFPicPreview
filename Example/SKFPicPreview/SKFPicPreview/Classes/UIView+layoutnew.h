//
//  UIView+layoutnew.h
//  HaoJiXingDayi
//
//  Created by 孙凯峰 on 16/6/29.
//  Copyright © 2016年 Kevin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    kOscillatoryAnimationToBigger,
    kOscillatoryAnimationToSmaller,
} KFOscillatoryAnimationType;

@interface UIView (layoutnew)
@property (nonatomic) CGFloat kf_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat kf_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat kf_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat kf_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat kf_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat kf_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat kf_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat kf_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint kf_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  kf_size;        ///< Shortcut for frame.size.

+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(KFOscillatoryAnimationType)type;
@end
