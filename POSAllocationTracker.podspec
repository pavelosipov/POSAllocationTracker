Pod::Spec.new do |s|
  s.name         = 'POSAllocationTracker'
  s.version      = '0.1.0'
  s.license      = 'MIT'
  s.summary      = 'Simple utility for runtime tracking instances of interested classes.'
  s.homepage     = 'https://github.com/pavelosipov/POSAllocationTracker'
  s.authors      = { 'Pavel Osipov' => 'posipov84@gmail.com' }
  s.source       = { :git => 'https://github.com/pavelosipov/POSAllocationTracker.git', :tag => '0.1.0' }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.xcconfig     = { 'CLANG_CXX_LANGUAGE_STANDARD' => 'C++11' }
  s.source_files = 'POSAllocationTracker/**/*.{h,m,mm,cpp}'
end
