# BROKEN DUE TO BUG, see https://github.com/CocoaPods/CocoaPods/issues/722

Pod::Spec.new do |s|
  s.name         = "AdMarvelContainer_new_but_broken"
  s.version      = "1.3.1"
  s.summary      = "All required frameworks for AdMarvelSDK."
  s.homepage     = "https://github.com/gangverk/AdMarvelContainer"
  s.license      = 'MIT'
  s.author       = { "Kevin Renskers" => "info@mixedcase.nl" }
  s.platform     = :ios
  s.requires_arc = true
  s.frameworks   = 'AssetsLibrary', 'AudioToolbox', 'CoreLocation', 
                   'EventKit', 'EventKitUI', 'Foundation', 'iAd', 'MediaPlayer', 
                   'MessageUI', 'QuartzCore', 'SystemConfiguration', 'UIKit'
  s.weak_frameworks = 'AdSupport'
  s.preferred_dependency = 'AdJitsu_GoogleAdMob_Millennial_Rhythm'

  s.subspec 'AdJitsu_GoogleAdMob_Millennial_Rhythm' do |agmr|
    agmr.dependency 'AdMarvelContainer_new_but_broken/AdJitsu'
    agmr.dependency 'AdMarvelContainer_new_but_broken/GoogleAdMob'
    agmr.dependency 'AdMarvelContainer_new_but_broken/Millennial'
  end

  s.subspec 'AdColony' do |adcolony|
    adcolony.xcconfig   = { 'OTHER_LDFLAGS' => '-ObjC' }
    adcolony.frameworks = 'AVFoundation', 'CFNetwork', 'CoreGraphics', 
                          'CoreMedia', 'CoreTelephony', 'StoreKit'
  end

  s.subspec 'AdJitsu' do |adjitsu|
    adjitsu.xcconfig   = { 'OTHER_LDFLAGS' => '-ObjC' }
    adjitsu.libraries  = 'sqlite3.0', 'stdc++', 'xml2', 'z'
    adjitsu.frameworks = 'AVFoundation', 'CFNetwork', 'CoreGraphics', 'CoreMedia', 
                         'CoreMotion', 'CoreText', 'MobileCoreServices', 'OpenGLES'
  end

  s.subspec 'Amazon' do |amazon|
    amazon.frameworks = 'CoreGraphics'
  end

  s.subspec 'GoogleAdMob' do |googleadMob|
    googleadMob.xcconfig   = { 'OTHER_LDFLAGS' => '-ObjC' }
    googleadMob.frameworks = 'CoreGraphics'
  end

  s.subspec 'Medialets' do |medialets|
    medialets.xcconfig   = { 'OTHER_LDFLAGS' => '-all_load' }
    medialets.libraries  = 'sqlite3.0', 'z', 'System'
    medialets.frameworks = 'AddressBook', 'CFNetwork'
  end

  s.subspec 'Millennial' do |millennial|
    millennial.xcconfig   = { 'OTHER_LDFLAGS' => '-ObjC' }
    millennial.frameworks = 'AVFoundation', 'CoreGraphics', 'MobileCoreServices'
  end
end
