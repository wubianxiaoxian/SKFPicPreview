# SKFPicPreview

[![CI Status](http://img.shields.io/travis/wubianxiaoxian/SKFPicPreview.svg?style=flat)](https://travis-ci.org/wubianxiaoxian/SKFPicPreview)
[![Version](https://img.shields.io/cocoapods/v/SKFPicPreview.svg?style=flat)](http://cocoapods.org/pods/SKFPicPreview)
[![License](https://img.shields.io/cocoapods/l/SKFPicPreview.svg?style=flat)](http://cocoapods.org/pods/SKFPicPreview)
[![Platform](https://img.shields.io/cocoapods/p/SKFPicPreview.svg?style=flat)](http://cocoapods.org/pods/SKFPicPreview)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Xcode 6 or higher
* iOS 7.0 or higher
* ARC

## Installation

* SKFPicPreview is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SKFPicPreview"
```

* 或者下载demo到本地将SKFPicPreview添加到工程，引入

```ruby
#import "SKFPreViewNavController.h"
```



## 按照下面的方法使用
* 预览网络图片

```ruby
SKFPreViewNavController *imagePickerVc =[[SKFPreViewNavController alloc]initWithSelectedPhotoURLs:self.Photosurlary index:indexPath.row];

[self presentViewController:imagePickerVc animated:YES completion:nil];
```


*预览本体图片

```ruby
SKFPreViewNavController *imagePickerVc = [[SKFPreViewNavController alloc] initWithSelectedPhotos:_selectedPhotos index:indexPath.row DeletePic:YES];

[imagePickerVc setDidFinishDeletePic:^(NSArray<UIImage *> *photos) {   }];

[self presentViewController:imagePickerVc animated:YES completion:nil];
```




## Author

wubianxiaoxian, xx@xx.com

## License

SKFPicPreview is available under the MIT license. See the LICENSE file for more info.
![](http://i1.piimg.com/4851/5d56f5cddbcff4df.gif)
