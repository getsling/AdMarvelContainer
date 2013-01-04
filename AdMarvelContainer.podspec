Pod::Spec.new do |s|
  s.name         = "AdMarvelContainer"
  s.version      = "1.3.1"
  s.summary      = "All required frameworks for AdMarvelSDK."
  s.homepage     = "https://github.com/gangverk/AdMarvelContainer"
  s.license      = 'MIT'
  s.author       = { "Kevin Renskers" => "info@mixedcase.nl" }
  s.source       = { :git => "https://github.com/gangverk/AdMarvelContainer.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.requires_arc = true
  s.xcconfig     = { 'OTHER_LDFLAGS' => '-ObjC -lsqlite3.0 -lstdc++ -lxml2 -lz' }
  s.frameworks   =  'AdSupport', 'AssetsLibrary', 'AudioToolbox', 'CoreLocation', 'EventKit', 'EventKitUI', 
                    'Foundation', 'iAd', 'MediaPlayer', 'MessageUI', 'QuartzCore', 'SystemConfiguration', 
                    'UIKit', 'AVFoundation', 'CFNetwork', 'CoreGraphics', 'CoreMedia', 'CoreMotion', 
                    'CoreText', 'MobileCoreServices', 'OpenGLES'
end
