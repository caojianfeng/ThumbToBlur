Pod::Spec.new do |spec|
  spec.name         = 'ThumbToBlur'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/caojianfeng/ThumbToBlur'
  spec.authors      = { 'Cao jianfeng' => 'windcao@hotmail.com' }
  spec.summary      = 'Make a thumb image to big and blur image.'
  spec.source       = { :git => 'https://github.com/caojianfeng/ThumbToBlur.git', :tag => 'v1.0.0' }
  spec.source_files = 'ThumbToBlur/ThumbToBlur/**/*.{h,m}'
  spec.framework    = 'SystemConfiguration'
end