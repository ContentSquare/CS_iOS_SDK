Pod::Spec.new do |s|
s.name = 'CS_iOS_SDK_STATIC'
s.version = '4.9.0'
s.summary = 'Contentsquare UX SDK for iOS'
s.homepage = 'https://docs.contentsquare.com/ios'
s.author = { 'Romain Bouic' => 'romain.bouic@contentsquare.com' }
s.license = { :type => 'COMMERCIAL' }
s.platform = :ios
s.source = { :http => 'https://github.com/wangjiejacques/CS_iOS_SDK/releases/download/v4.6.1/Archive.zip' }
s.swift_version = '5.1'
s.ios.deployment_target = '11.0'
s.ios.vendored_frameworks = 'ContentsquareModule.xcframework'
s.dependency 'SwiftProtobuf', '~> 1.0'
s.resource = 'ContentsquareModuleWrapper/ContentsquareBundle.bundle'
end
