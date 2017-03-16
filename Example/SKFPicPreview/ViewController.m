//
//  ViewController.m
//  SKFPicturePikerDemo
//
//  Created by 孙凯峰 on 2017/2/13.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
/*https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490259753&di=ad23242e027fb42fe14f271829b4ade6&imgtype=jpg&er=1&src=http%3A%2F%2Ffile28.mafengwo.net%2FM00%2F70%2FDF%2FwKgB6lS8c3yANYTlAALCMp5REYo36.jpeg8?
 
 https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489665034841&di=80337d2e548a9063d45d0c40019e559e&imgtype=0&src=http%3A%2F%2Fc.abatour.com%2Fupfiles%2F2014-02-19%2F44e129111f4e430da18891d8c3322b550.jpg
 https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489665034841&di=4475e90d3aab0b7ce1a15afadcab6c3f&imgtype=0&src=http%3A%2F%2Fchengdu.wabuw.com%2Fuploads%2Fimage%2F111217155452_1229.jpg
 
 https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489665034840&di=700eab6056e0a4ebec0f3f003881d51e&imgtype=0&src=http%3A%2F%2Fimg1.qunarzz.com%2Fsight%2Fp0%2F201301%2F08%2Fe338282fd4401af393835fbb.jpg
 
 
 
 */

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#import "LxGridViewFlowLayout.h"
#import "ViewController.h"
#import "KFCollectionCell.h"
#import "SKFCamera.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "SKFPreViewNavController.h"
#import "KFCollectionCellTwo.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    //    NSMutableArray *_selectedAssets;
//    CGFloat _margin;
//    CGFloat _itemWH;
//    
    
}
@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) UICollectionView * collectionViewtwo;

@property(nonatomic,strong)  LxGridViewFlowLayout *layout;

@property(nonatomic,strong)  LxGridViewFlowLayout *layouttwo;

@property(nonatomic,assign) CGFloat  margin;
@property(nonatomic,assign) CGFloat  itemWH;

@property(nonatomic,strong)   NSMutableArray *selectedPhotos;
;
@property(nonatomic,strong) NSMutableArray * Photosurlary;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _margin = 0;
    
    _layout = [[LxGridViewFlowLayout alloc] init];
    self.itemWH = (self.view.frame.size.width-60)/4;
    _layout.itemSize = CGSizeMake(self.itemWH, self.itemWH);
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, (self.view.frame.size.width-60)/4) collectionViewLayout:_layout];
    self.collectionView.backgroundColor=UIColorFromRGB(0xeeeeee);
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.navigationController.navigationBar.barTintColor=UIColorFromRGB(0x00cbdd);
    [self.view addSubview:self.collectionView];
    self.collectionView.tag=1001;
    [self.collectionView registerClass:[KFCollectionCell class] forCellWithReuseIdentifier:@"KFCollectionCell"];
    
    _layouttwo = [[LxGridViewFlowLayout alloc] init];
    self.itemWH = (self.view.frame.size.width-30)/4;
    _layouttwo.itemSize = CGSizeMake(self.itemWH, self.itemWH);
    
    
    
    self.collectionViewtwo=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, (self.view.frame.size.width-30)/4*2+10) collectionViewLayout:_layouttwo];
    self.collectionViewtwo.backgroundColor=UIColorFromRGB(0xeeeeee);
    self.collectionViewtwo.delegate=self;
    self.collectionViewtwo.dataSource=self;
    self.collectionViewtwo.tag=1002;
    self.navigationController.navigationBar.barTintColor=UIColorFromRGB(0x00cbdd);
    [self.view addSubview:self.collectionViewtwo];
    [self.collectionViewtwo registerClass:[KFCollectionCellTwo class] forCellWithReuseIdentifier:@"KFCollectionCellTwo"];
    NSArray *picurls=@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489665034840&di=b4a1adf2a4b9cdd9ec5ba391821979d8&imgtype=0&src=http%3A%2F%2Fwww.txw6.com%2Fuploads%2Fallimg%2F141120%2F49-141120152U50-L.jpg",
                       @"https://youimg1.c-ctrip.com/target/100s070000002ha9lC7A5.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489665034841&di=80337d2e548a9063d45d0c40019e559e&imgtype=0&src=http%3A%2F%2Fc.abatour.com%2Fupfiles%2F2014-02-19%2F44e129111f4e430da18891d8c3322b550.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489665034841&di=4475e90d3aab0b7ce1a15afadcab6c3f&imgtype=0&src=http%3A%2F%2Fchengdu.wabuw.com%2Fuploads%2Fimage%2F111217155452_1229.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489665034840&di=700eab6056e0a4ebec0f3f003881d51e&imgtype=0&src=http%3A%2F%2Fimg1.qunarzz.com%2Fsight%2Fp0%2F201301%2F08%2Fe338282fd4401af393835fbb.jpg"];
    self.Photosurlary=[NSMutableArray arrayWithArray:picurls];
    
    
    
    
    
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
    if (collectionView.tag==1001) {
        return _selectedPhotos.count + 1;

    }
     if (collectionView.tag==1002){
        return self.Photosurlary.count ;

    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    
    if (collectionView.tag==1001) {
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
    if (collectionView.tag==1002){
   KFCollectionCellTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KFCollectionCellTwo" forIndexPath:indexPath];
    
        [cell.KFCellimageView sd_setImageWithURL:[NSURL URLWithString:self.Photosurlary[indexPath.row]]];
        
        
        return cell;
    }
    /*   if (collectionView.tag==1001) {
     
     }
     if (collectionView.tag==1002){
     
     }*/
    return nil;
    
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

    
    
    if (collectionView.tag==1001) {
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
            }];
            [self presentViewController:imagePickerVc animated:YES completion:nil];
        }
    }
    
    
    
    if (collectionView.tag==1002){
        SKFPreViewNavController *imagePickerVc =[[SKFPreViewNavController alloc]initWithSelectedPhotoURLs:self.Photosurlary index:indexPath.row];

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
    
    if (buttonIndex==1) {
        //调用系统相册的类
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        
        
        //设置选取的照片是否可编辑
        pickerController.allowsEditing = YES;
        //设置相册呈现的样式
        pickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;//图片分组列表样式
        //照片的选取样式还有以下两种
        //UIImagePickerControllerSourceTypePhotoLibrary,直接全部呈现系统相册
        //UIImagePickerControllerSourceTypeCamera//调取摄像头
        
        //选择完成图片或者点击取消按钮都是通过代理来操作我们所需要的逻辑过程
        pickerController.delegate = self;
        //使用模态呈现相册
        [self presentViewController:pickerController animated:YES completion:^{
            
        }];
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    [self.selectedPhotos addObject:image];
    [self.collectionView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
