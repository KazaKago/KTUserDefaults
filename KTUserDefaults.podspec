Pod::Spec.new do |s|
  s.name         = "KTUserDefaults"
  s.version      = "1.0.0"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "This is transaction support NSUserDefaults."
  s.homepage     = "https://github.com/weathercock/KTUserDefaults"
  s.authors      = { "Kazamidori" => "http://weathercock.tmrnk.com/" }
  s.source       = { :git => "https://github.com/weathercock/KTUserDefaults.git", :tag => "v#{s.version}" }
  s.platform     = :ios, '4.3'
  s.source_files = 'KTUserDefaults'
  s.requires_arc = true
end