# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Marvel' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Marvel
  pod 'CryptoSwift'
  pod 'RxAlamofire', :git => 'https://github.com/RxSwiftCommunity/RxAlamofire', :branch => 'master'
  pod 'AsyncImageView'
  pod 'UIScrollView-InfiniteScroll'
  pod 'SVProgressHUD'
  pod 'IOStickyHeader'

  def testing_pods
    pod 'Quick'
    pod 'Nimble'
  end

  target 'MarvelTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

  target 'MarvelUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Acceptance Tests' do
    pod 'KIF'
    testing_pods
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
