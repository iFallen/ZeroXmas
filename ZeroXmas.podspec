Pod::Spec.new do |s|
  s.name             = 'ZeroXmas'
  s.version          = '0.9.1'
  s.summary          = 'ZeroXmas is a lightweight Common UI Config Lib for iOS , write by swift.'
  s.description      = <<-DESC
TODO: Config plist file in ZXSetting.bundle, Use UIColor.zx.xxx UIFont.zx.xxx and TabBar NavBar Config and so on.
                       DESC

  s.homepage         = 'https://github.com/iFallen/ZeroXmas'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iFallen' => 'hulj1204@yahoo.com' }
  s.source           = { :git => 'https://github.com/iFallen/ZeroXmas.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files          = 'ZeroXmas/**/*.swift'
  s.resource              = 'ZeroXmas/ZXSettings.bundle'
end
