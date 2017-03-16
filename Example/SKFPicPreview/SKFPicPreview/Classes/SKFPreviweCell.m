//
//  SKFPreviweCell.m
//  SKFPicPreview
//
//  Created by 孙凯峰 on 2017/3/16.
//  Copyright © 2017年 wubianxiaoxian. All rights reserved.
//
#import "UIView+layoutnew.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "SKFPreviweCell.h"
@interface SKFPreviweCell()<UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *imageContainerView;
@end
@implementation SKFPreviweCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 0, self.kf_width, self.kf_height);
        _scrollView.bouncesZoom = YES;
        _scrollView.maximumZoomScale = 2.5;
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.multipleTouchEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.scrollsToTop = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollView.delaysContentTouches = NO;
        _scrollView.canCancelContentTouches = YES;
        _scrollView.alwaysBounceVertical = NO;
        [self addSubview:_scrollView];
        
        _imageContainerView = [[UIView alloc] init];
        _imageContainerView.clipsToBounds = YES;
        [_scrollView addSubview:_imageContainerView];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        _imageView.clipsToBounds = YES;
        [_imageContainerView addSubview:_imageView];
        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        [self addGestureRecognizer:tap1];
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        tap2.numberOfTapsRequired = 2;
        [tap1 requireGestureRecognizerToFail:tap2];
        [self addGestureRecognizer:tap2];
    }
    return self;
}
-(void)setKImageView:(NSString *)image{
    //拍照 10174123.jpg
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"拍照"]];
    [self resizeSubviews];
}
-(void)setKNativeImageview:(UIImage *)image{
    self.imageView.image = image;
    [self resizeSubviews];
}
- (void)resizeSubviews {
    _imageContainerView.kf_origin = CGPointZero;
    _imageContainerView.kf_width = self.kf_width;
    
    UIImage *image = _imageView.image;
    if (image.size.height / image.size.width > self.kf_height / self.kf_width) {
        _imageContainerView.kf_height = floor(image.size.height / (image.size.width / self.kf_width));
    } else {
        CGFloat height = image.size.height / image.size.width * self.kf_width;
        if (height < 1 || isnan(height)) height = self.kf_height;
        height = floor(height);
        _imageContainerView.kf_height = height;
        _imageContainerView.kf_centerY = self.kf_height / 2;
    }
    if (_imageContainerView.kf_height > self.kf_height && _imageContainerView.kf_height - self.kf_height <= 1) {
        _imageContainerView.kf_height = self.kf_height;
    }
    _scrollView.contentSize = CGSizeMake(self.kf_width, MAX(_imageContainerView.kf_height, self.kf_height));
    [_scrollView scrollRectToVisible:self.bounds animated:NO];
    _scrollView.alwaysBounceVertical = _imageContainerView.kf_height <= self.kf_height ? NO : YES;
    _imageView.frame = _imageContainerView.bounds;
}
#pragma mark - UITapGestureRecognizer Event

- (void)doubleTap:(UITapGestureRecognizer *)tap {
    if (_scrollView.zoomScale > 1.0) {
        [_scrollView setZoomScale:1.0 animated:YES];
    } else {
        CGPoint touchPoint = [tap locationInView:self.imageView];
        CGFloat newZoomScale = _scrollView.maximumZoomScale;
        CGFloat xsize = self.frame.size.width / newZoomScale;
        CGFloat ysize = self.frame.size.height / newZoomScale;
        [_scrollView zoomToRect:CGRectMake(touchPoint.x - xsize/2, touchPoint.y - ysize/2, xsize, ysize) animated:YES];
    }
}

- (void)singleTap:(UITapGestureRecognizer *)tap {
    if (self.singleTapGestureBlock) {
        self.singleTapGestureBlock();
    }
}

#pragma mark - UIScrollViewDelegate

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageContainerView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat offsetX = (scrollView.kf_width > scrollView.contentSize.width) ? (scrollView.kf_width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.kf_height > scrollView.contentSize.height) ? (scrollView.kf_height - scrollView.contentSize.height) * 0.5 : 0.0;
    self.imageContainerView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX, scrollView.contentSize.height * 0.5 + offsetY);
}


@end
