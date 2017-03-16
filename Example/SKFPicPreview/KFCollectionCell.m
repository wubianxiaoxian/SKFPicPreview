//
//  KFCollectionCell.m
//  SKFPicturePikerDemo
//
//  Created by 孙凯峰 on 2017/2/14.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import "KFCollectionCell.h"
#import "UIView+layoutnew.h"

@implementation KFCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _KFCellimageView = [[UIImageView alloc] init];
        _KFCellimageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        //        _KFCellimageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_KFCellimageView];
        self.clipsToBounds = YES;
        //KFCellDeleteButton
        _KFCellDeleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_KFCellDeleteButton setImage:[UIImage imageNamed:@"photo_delete"] forState:UIControlStateNormal];
        _KFCellDeleteButton.frame = CGRectMake(self.kf_width - 36, 0, 36, 36);
        _KFCellDeleteButton.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -10);
        _KFCellDeleteButton.alpha = 1;
        [self addSubview:_KFCellDeleteButton];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _KFCellimageView.frame = self.bounds;
}
- (void)setRow:(NSInteger)row {
    _KFCellrow = row;
    _KFCellDeleteButton.tag = row;
}
- (UIView *)KFCellsnapshotView {
    UIView *snapshotView = [[UIView alloc]init];
    
    UIView *cellSnapshotView = nil;
    
    if ([self respondsToSelector:@selector(snapshotViewAfterScreenUpdates:)]) {
        cellSnapshotView = [self snapshotViewAfterScreenUpdates:NO];
    } else {
        CGSize size = CGSizeMake(self.bounds.size.width + 20, self.bounds.size.height + 20);
        UIGraphicsBeginImageContextWithOptions(size, self.opaque, 0);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * cellSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        cellSnapshotView = [[UIImageView alloc]initWithImage:cellSnapshotImage];
    }
    
    snapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    cellSnapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    
    [snapshotView addSubview:cellSnapshotView];
    return snapshotView;
}
@end
