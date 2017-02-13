Pod::Spec.new do |s|
s.name = 'PulsTabBarDemo'
s.license = { :type => 'vic' }
s.version = '1.0.0'
s.summary = 'the puls TabBar in center button'
s.homepage = 'https://github.com/vicczhang/PulsTabBarDemo'
s.platform = :ios
s.author = {'vicczhang' => 'vicczhang47@gmail.com'}
s.ios.deployment_target = '9.0'
s.source = {:git => 'https://github.com/vicczhang/PulsTabBarDemo.git',:tag => s.version}
s.source_files = 'PulsTabBarDemo/*.{swift}'
s.requires_arc = true
s.frameworks = 'UIKit','Foundation'
end
