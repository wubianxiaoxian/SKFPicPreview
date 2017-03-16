#
# Be sure to run `pod lib lint SKFPicPreview.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SKFPicPreview'
  s.version          = '1.1'
s.summary          = ' This is a preview of the library
.'



  s.description      = <<-DESC
This is a preview of the library xxxxx.
                       DESC

  s.homepage         = 'https://github.com/wubianxiaoxian/SKFPicPreview'
   s.screenshots     = 'http://i1.piimg.com/4851/5d56f5cddbcff4df.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wubianxiaoxian' => 'xx@xx.com' }
  s.source           = { :git => 'https://github.com/wubianxiaoxian/SKFPicPreview.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SKFPicPreview/Classes/**/*'
#s.resource  = "SKFTestviewDemo/SKFTestviewDemo/SKFTestview/SKFtest.bundle"

   s.resource_bundles = {
     'SKFPicPreview' => ['Resuorces/SKFPicPreview/Assets/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'SDWebImage'
end
