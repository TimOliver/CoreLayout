Pod::Spec.new do |s|
  s.name     = 'CoreLayout'
  s.version  = '0.0.5'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'A collection of low-level convenience properties and extensions for laying out UI components in iOS.'
  s.homepage = 'https://github.com/TimOliver/CoreLayout'
  s.author   = 'Tim Oliver'
  s.source   = { :git => 'https://github.com/TimOliver/CoreLayout.git', :tag => s.version }
  s.platform = :ios, '13.0'
  s.source_files = 'CoreLayout/**/*.swift'
  s.requires_arc = true
  s.swift_version = '5.0'
end
