Pod::Spec.new do |s|
  s.name         = 'MKPopoverColorWell'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.summary      = 'A better looking NSColorWell, with a simple popover color picker.'
  s.homepage     = 'https://github.com/mkdynamic/MKPopoverColorWell'
  s.author       = { 'Mark Dodwell' => 'mark@mkdynamic.co.uk' }
  s.source       = { :git => 'https://github.com/mkdynamic/MKPopoverColorWell.git', :tag => 'v0.0.1' }
  s.description  = 'An optional longer description of MKPopoverColorWell.'
  s.platform     = :osx
  s.source_files = '*.{h,m}'
  s.framework    = 'Cocoa'
end
