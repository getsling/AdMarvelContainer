Pod::Spec.new do |s|
  s.name            = "AdMarvelContainer"
  s.version         = "1.3.2"
  s.summary         = "All required frameworks for AdMarvelSDK."
  s.homepage        = "https://github.com/gangverk/AdMarvelContainer"
  s.license         = 'MIT'
  s.author          = { "Kevin Renskers" => "info@mixedcase.nl" }
  s.source          = { :git => "https://github.com/gangverk/AdMarvelContainer.git", :tag => s.version.to_s }
  s.platform        = :ios
  s.requires_arc    = true
  s.xcconfig        = { 'OTHER_LDFLAGS' => '-ObjC' }
  s.libraries       = 'sqlite3.0', 'stdc++', 'xml2', 'z'
  s.weak_frameworks = 'AdSupport', 'Social', 'StoreKit'
  s.frameworks      =  'AssetsLibrary', 'AudioToolbox', 'CoreLocation', 'EventKit', 'EventKitUI', 
                       'Foundation', 'iAd', 'MediaPlayer', 'MessageUI', 'QuartzCore', 'SystemConfiguration', 
                       'AVFoundation', 'CFNetwork', 'CoreGraphics', 'CoreMedia', 'CoreMotion', 
                       'CoreText', 'MobileCoreServices', 'OpenGLES'
end