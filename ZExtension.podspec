Pod::Spec.new do |s|

  s.name = "ZExtension"
  s.version = "0.1.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = "Apple framework extensions for an easier and faster coding "
  s.homepage = "https://github.com/omiz/ZExtension"
  s.author = { "Omar Allaham" => "o.allaham@icloud.com" }
  s.source = { :git => 'https://github.com/omiz/ZExtension.git', :tag => s.version.to_s }

  s.platform     = :ios, "8.0"

  s.requires_arc = 'true'
  s.source_files = 'ZExtension/*.swift'

end