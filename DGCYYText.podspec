Pod::Spec.new do |s|
  s.name         = 'DGCYYText'
  s.summary      = 'Powerful text framework for iOS to display and edit rich text.'
  s.version      = '1.2.4'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com', 'yy' => 'yanyin1986@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/ibireme/DGCYYText'
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source           = { :git => 'https://github.com/wangweiqi864-hue/DGCYYText.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'DGCYYText/**/*.{h,m}'
  s.public_header_files = 'DGCYYText/**/*.{h}'
  
  s.frameworks = 'UIKit', 'CoreFoundation','CoreText', 'QuartzCore', 'Accelerate', 'CoreServices'

end
