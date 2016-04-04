#
#  Be sure to run `pod spec lint BigShot.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "BigShot"
  s.version      = "0.1"
  s.summary      = "BigShot is a utility framework for iOS that lets you take long vertical screenshots of your app"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = "BigShot is written purely in Swift, its a simple implementation that manipulates the UIWindow's frame to take long vertical screenshots, no need to scroll and take multiple screenshots."



  s.homepage            = "https://github.com/tapthaker/BigShot"
  s.screenshots         = "https://raw.githubusercontent.com/tapthaker/BigShot/master/screenshot.jpg"
  s.license             = "WTFPL"
  s.license             = { :type => "WTFPL", :file => "LICENSE.txt" }
  s.author              = { "Tapan Thaker" => "tapan.d.thaker@gmail.com" }
  s.social_media_url    = "http://twitter.com/tapthaker"
  s.platform            = :ios, "8.0"
  s.source              = { :git => "https://github.com/tapthaker/BigShot.git", :tag => "0.1" }
  s.source_files        = "Framework/BigShot"
  s.public_header_files = "Framework/BigShot"
  s.resources           = "Framework/BigShot/*.xib"
  
end
