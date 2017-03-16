//
//  KFCollectionCellTwo.m
//  SKFPicPreview
//
//  Created by 孙凯峰 on 2017/3/16.
//  Copyright © 2017年 wubianxiaoxian. All rights reserved.
//

#import "KFCollectionCellTwo.h"

@implementation KFCollectionCellTwo
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _KFCellimageView = [[UIImageView alloc] init];
        _KFCellimageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        [self addSubview:_KFCellimageView];
        self.clipsToBounds = YES;
        //KFCellDeleteButton

    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _KFCellimageView.frame = self.bounds;
}
@end
