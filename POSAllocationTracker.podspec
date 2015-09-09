Pod::Spec.new do |s|
  s.name         = 'POSAllocationTracker'
  s.version      = '1.0.1'
  s.license      = 'MIT'
  s.summary      = 'Simple utility for runtime tracking instances of interested classes.'
  s.homepage     = 'https://github.com/pavelosipov/POSAllocationTracker'
  s.authors      = { 'Pavel Osipov' => 'posipov84@gmail.com' }
  s.source       = { :git => 'https://github.com/pavelosipov/POSAllocationTracker.git', :tag => '1.0.1' }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.xcconfig     = { 'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
                     'OTHER_LDFLAGS' => '-lc++' }
  s.source_files = 'POSAllocationTracker/**/*.{h,m,mm,cpp}'
end
