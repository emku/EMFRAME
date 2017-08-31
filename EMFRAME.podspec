Pod::Spec.new do |s|
  s.name             = "EMFRAME"
  s.version          = "0.0.2"
  s.summary          = "framework standar untuk membangun aplikasi IOS berisi alamofire, , ,"
  s.homepage         = "https://github.com/emku/EMFRAME"
  s.license          = "MIT (ios)"
  s.author           = { "Emkukuh" => "emkukuh@gmail.com" }
  s.source           = { :git => "https://github.com/emku/EMFRAME.git", :tag => "#{s.version}" }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'EMFRAME/Classes/**/*.{h,m,swift}'
  s.resources = 'EMFRAME/Assets/*'

  s.module_name = 'EMFRAME'

  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'HexColors'
end