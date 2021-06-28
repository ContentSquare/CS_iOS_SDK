Pod::Spec.new do |s|
	s.name = 'CS_iOS_SDK'
	s.version = '4.4.1'
	s.summary = 'Contentsquare UX SDK for iOS'
	s.homepage = 'https://docs.contentsquare.com/ios'
	s.author = { 'Romain Bouic' => 'romain.bouic@contentsquare.com' }
	s.license = { :type => 'COMMERCIAL' }
	s.platform = :ios
	s.source = { :http => 'https://github.com/ContentSquare/CS_iOS_SDK/releases/download/v1.1.1/ContentsquareModule.xcframework.zip' }
	s.swift_version = '5.1'
	s.ios.deployment_target = '10.0'
	s.ios.vendored_frameworks = 'ContentsquareModule.xcframework'
end