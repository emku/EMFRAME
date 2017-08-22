Pod::Spec.new do |s|
s.name         = "EMFRAME"
s.version      = "0.0.1"
s.summary      = "framework standar untuk membangun aplikasi IOS berisi alamofire, , ,"
s.homepage     = "https://github.com/emku/EMFRAME"
s.license      = "MIT (ios)"
s.author             = { "Emkukuh" => "emkukuh@gmail.com" }
s.source       = { :git => "https://github.com/emku/EMFRAME", :tag => "#{s.version}" }
s.source_files  = "EMFRAME/Classes/**/*.{h,m,swift}"
s.resource_bundles = {'EMFRAME' => ['EMFRAME/Assets/*.{storyboard,xib,xcassets,json,imageset,png,plist}']}
s.resource = 'EMFRAME/Assets/*'
s.platform = :ios, "9.0"
s.dependency 'Alamofire'

s.dependency 'IQKeyboardManagerSwift'

s.dependency 'HexColors'
end
