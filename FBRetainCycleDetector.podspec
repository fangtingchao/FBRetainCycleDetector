#
# Be sure to run `pod lib lint FBRetainCycleDetector.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FBRetainCycleDetector'
  s.version          = '0.1.2'
  s.summary      = "Library that helps with detecting retain cycles in iOS apps"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.homepage         = 'https://github.com/fangtingchao/FBRetainCycleDetector'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fangtingchao' => '“ftc0423@163.com”' }
  s.source           = { :git => 'https://github.com/fangtingchao/FBRetainCycleDetector.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files  = "FBRetainCycleDetector", "{FBRetainCycleDetector,rcd_fishhook}/**/*.{h,m,mm,c}"

  mrr_files = [
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Associations/FBAssociationManager.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Associations/FBAssociationManager.mm',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Layout/Blocks/FBBlockStrongLayout.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Layout/Blocks/FBBlockStrongLayout.m',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Layout/Blocks/FBBlockStrongRelationDetector.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Layout/Blocks/FBBlockStrongRelationDetector.m',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Layout/Classes/FBClassStrongLayoutHelpers.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Layout/Classes/FBClassStrongLayoutHelpers.m',
  ]

  files = Pathname.glob("FBRetainCycleDetector/Classes/FBRetainCycleDetector/**/*.{h,m,mm}")
  files = files.map {|file| file.to_path}
  files = files.reject {|file| mrr_files.include?(file)}

  s.requires_arc = files.sort + [
    'FBRetainCycleDetector/Classes/fishhook/**/*.{c,h}'
  ]
  s.public_header_files = [
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Detector/FBRetainCycleDetector.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Associations/FBAssociationManager.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Graph/FBObjectiveCBlock.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Graph/FBObjectiveCGraphElement.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Graph/Specialization/FBObjectiveCNSCFTimer.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Graph/FBObjectiveCObject.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Graph/FBObjectGraphConfiguration.h',
    'FBRetainCycleDetector/Classes/FBRetainCycleDetector/Filtering/FBStandardGraphEdgeFilters.h',
  ]

  s.framework = "Foundation", "CoreGraphics", "UIKit"
  s.library = 'c++'
end
