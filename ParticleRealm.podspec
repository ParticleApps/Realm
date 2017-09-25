Pod::Spec.new do |spec|
  spec.name                  = 'ParticleRealm'
  spec.version               = '0.1.0'
  spec.summary               = 'Extensions & classes used with Realm https://realm.io.'
  spec.description           = 'Adds observers, better JSON handling, & convienence extensions.'
  spec.homepage              = 'https://github.com/ParticleApps/'
  spec.license               = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                = { 'Rocco Del Priore' => 'rocco@particleapps.co' }
  spec.source                = { :git => 'https://github.com/ParticleApps/Realm.git', :tag => s.version.to_s }
  spec.social_media_url      = 'https://twitter.com/ParticleAppsCo'
  spec.ios.deployment_target = '8.0'
  spec.source_files          = 'ParticleRealm/Classes/**/*'
  spec.dependency "Realm"
end
