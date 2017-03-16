//
//  ViewController.m
//  SKFPicturePikerDemo
//
//  Created by 孙凯峰 on 2017/2/13.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#import "LxGridViewFlowLayout.h"
#import "ViewController.h"
#import "KFCollectionCell.h"
#import "SKFCamera.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "SKFPreViewNavController.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIActionSheetDelegate>
{
    //    NSMutableArray *_selectedAssets;
    BOOL _isSelectOriginalPhoto;
    CGFloat _margin;
    CGFloat _itemWH;
    
    
}
@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong)  LxGridViewFlowLayout *layout;
;
@property(nonatomic,assign) CGFloat  itemWH;
@property(nonatomic,strong)   NSMutableArray *selectedPhotos;
;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _margin = 0;
    
    _layout = [[LxGridViewFlowLayout alloc] init];
    self.itemWH = (self.view.frame.size.width-60)/4;
    _layout.itemSize = CGSizeMake(self.itemWH, self.itemWH);
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, (self.view.frame.size.width-60)/4) collectionViewLayout:_layout];
    _collectionView.backgroundColor=UIColorFromRGB(0xeeeeee);
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    self.navigationController.navigationBar.barTintColor=UIColorFromRGB(0x00cbdd);
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[KFCollectionCell class] forCellWithReuseIdentifier:@"KFCollectionCell"];
    
    // Do any additional setup after loading the view, typically from a nib.
}-(void)viewWillAppear:(BOOL)animated{
    [_collectionView reloadData];
    
}
-(NSMutableArray *)selectedPhotos{
    if (!_selectedPhotos) {
        _selectedPhotos=[[NSMutableArray alloc]init];
    }
    return _selectedPhotos;
}

#pragma mark   ------------- UIColletionDelegate --------------
//指定setion个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//指定section中的colletionviewCELL的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _selectedPhotos.count + 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KFCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KFCollectionCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor=UIColorFromRGB(0xeeeeee);
    if (indexPath.row == _selectedPhotos.count) {
        cell.KFCellimageView.image = [UIImage imageNamed:@"+"];
        cell.KFCellDeleteButton.hidden = YES;
    }
    else if(indexPath.row<3){
        cell.KFCellimageView.image = _selectedPhotos[indexPath.row];
        cell.KFCellDeleteButton.hidden = NO;
        cell.KFCellDeleteButton.tag = indexPath.row;
        [cell.KFCellDeleteButton addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}
- (void)deleteBtnClik:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    _layout.itemCount = _selectedPhotos.count;
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];
    }];
}
#pragma mark   ------------- 点击cell --------------

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row>2) {
        return;
    }
    else if (indexPath.row == _selectedPhotos.count) {
        [self.view endEditing:YES];
        UIActionSheet *action=[[UIActionSheet alloc] initWithTitle:@"选取照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从摄像头选取", @"从图片库选择",nil];
        [action showInView:self.view];
    } else { // preview photos / 预览照片
        SKFPreViewNavController *imagePickerVc = [[SKFPreViewNavController alloc] initWithSelectedPhotos:_selectedPhotos index:indexPath.row DeletePic:YES];
        [imagePickerVc setDidFinishDeletePic:^(NSArray<UIImage *> *photos) {
            _selectedPhotos = [NSMutableArray arrayWithArray:photos];
            _layout.itemCount = _selectedPhotos.count;
            _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
        }];
        
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}
#pragma mark   ------------- 相机还是相册--------------
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            SKFCamera *homec = [[SKFCamera alloc] init];
            __weak typeof(self) myself = self;
            homec.fininshcapture = ^(UIImage *image) {
                if (image) {
                    NSLog(@"照片存在");
                    [myself.selectedPhotos addObject:image];
                    [myself.collectionView reloadData];
                }
            };
            [myself presentViewController:homec  animated:NO
                               completion:^{
                               }];
        }}
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
