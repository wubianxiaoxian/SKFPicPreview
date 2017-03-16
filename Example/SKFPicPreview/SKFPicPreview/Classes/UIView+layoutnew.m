//
//  UIView+layoutnew.m
//  HaoJiXingDayi
//
//  Created by 孙凯峰 on 16/6/29.
//  Copyright © 2016年 Kevin Sun. All rights reserved.
//

#import "UIView+layoutnew.h"

@implementation UIView (layoutnew)
- (CGFloat)kf_left {
    return self.frame.origin.x;
}

- (void)setKf_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)kf_top {
    return self.frame.origin.y;
}

- (void)setKf_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)kf_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setKf_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)kf_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setKf_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)kf_width {
    return self.frame.size.width;
}

- (void)setKf_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)kf_height {
    return self.frame.size.height;
}

- (void)setKf_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)kf_centerX {
    return self.center.x;
}

- (void)setKf_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)kf_centerY {
    return self.center.y;
}

- (void)setKf_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)kf_origin {
    return self.frame.origin;
}

- (void)setKf_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)kf_size {
    return self.frame.size;
}

- (void)setKf_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(KFOscillatoryAnimationType)type{
    NSNumber *animationScale1 = type == kOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber *animationScale2 = type == kOscillatoryAnimationToBigger ? @(0.92) : @(1.15);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

@end
