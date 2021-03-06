
Pod::Spec.new do |s|
  s.name         = "MKDevice"
  s.version      = "0.9.0"
  s.summary      = "A convenience library for querying device and system information."
  s.homepage     = "https://github.com/michalkonturek/MKDevice"
  s.license      = 'MIT'

  s.author       = { 
  "Michal Konturek" => "michal.konturek@gmail.com" 
  }

  s.ios.deployment_target = '7.0'

  s.social_media_url = 'https://twitter.com/michalkonturek'
  s.source       = { 
    :git => "https://github.com/michalkonturek/MKDevice.git", 
    :tag => "0.9.0" 
  }

  s.source_files = 'MKDevice/Source/**/*.{h,m}'
  s.requires_arc = true

  s.dependency 'MKFoundationKit', '>= 1.2.0'
end
