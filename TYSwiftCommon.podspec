#
# Be sure to run `pod lib lint TYSwiftCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TYSwiftCommon'
  s.version          = '1.0.8'
  s.summary          = '自用的一个开发库，包含常见的使用方法'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Style-Tender/TYSwiftCommon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Style-Tender' => '785072254@qq.com' }
  s.source           = { :git => 'https://github.com/Style-Tender/TYSwiftCommon.git', :tag => s.version.to_s }
  s.swift_version = '4.0'
  s.ios.deployment_target = '11.0'
  s.resources = 'TYSwiftCommon/Assets/DeviceModel.plist'
  s.source_files = 'TYSwiftCommon/Classes/**/*.{swift,h,m}'
  s.dependency 'Alamofire', '~> 5.4.0'
  
end
