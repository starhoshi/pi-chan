# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'pi-chan' do
  pod 'Font-Awesome-Swift'
  pod 'DGElasticPullToRefresh'
  pod 'SVProgressHUD'
  pod 'VTAcknowledgementsViewController'
  pod 'Dollar'
  pod 'Cent'
  pod 'KeychainAccess'
  pod 'Siren'
  pod 'SwiftDate'
  pod 'NSDate+TimeAgo'
  pod 'DZNEmptyDataSet'
  pod 'Kingfisher'
  pod 'APIKit'
  pod "Himotoki"
  pod 'DynamicColor'
  pod 'SCLAlertView'
  pod 'SDCAlertView'
  pod 'IQKeyboardManagerSwift'
  pod "OAuthSwift"
  pod 'XLActionController/Twitter'
  pod 'Fabric'
  pod 'Crashlytics'
  pod 'Toaster'
  pod 'MGSwipeTableCell'
  pod 'Log'
end

post_install do |installer|
  puts("Update debug pod settings to speed up build time")
  Dir.glob(File.join("Pods", "**", "Pods*{debug,Private}.xcconfig")).each do |file|
    File.open(file, 'a') { |f| f.puts "\nDEBUG_INFORMATION_FORMAT = dwarf" }
  end
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
