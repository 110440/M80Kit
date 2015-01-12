Pod::Spec.new do |s|
  s.name = 'M80Kit'
  s.version = '1.0.3'
  s.authors = {'Xiang Wangfeng' => 'xiangwangfeng@gmail.com'}
  s.homepage = 'https://github.com/xiangwangfeng/M80Kit/'
  s.summary = 'A collection of iOS classes & categories '
  s.source = {:git => 'https://github.com/xiangwangfeng/M80Kit.git', :tag => s.version.to_s}
  s.license = 'MIT'
  s.requires_arc = true
  s.platform = :ios
  s.ios.deployment_target = '5.0'
  s.source_files = '{M80Kit}/*.{h,m}'

  s.subspec 'Categories' do |ss|
    ss.source_files = 'M80Kit/Classes/Categories/*.{h,m}'
  end

  s.subspec 'Util' do |ss|
    ss.source_files = 'M80Kit/Classes/Util/*.{h,m}'
  end

  s.subspec 'Network' do |ss|
    ss.source_files = 'M80Kit/Classes/Network/*.{h,m}'
  end
end
