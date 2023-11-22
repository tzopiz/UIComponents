Pod::Spec.new do |spec|
  spec.name         = 'UIComponents'
  spec.version      = '0.1.0'
  spec.summary      = 'Custom UIviews'

  spec.homepage     = 'https://github.com/tzopiz'
  spec.license      = 'MIT'
  spec.author       = { 'Korchagin Dmitry' => 'dmitry.korchagin.s@gmail.com' }
  spec.platform     = :ios, '15.0'
  spec.source       = { :git => 'https://github.com/tzopiz.git', :tag => "#{spec.version}" }
  spec.source_files = '**/*.{h,m,swift,xib,storyboard}'

  spec.dependency 'SnapKit'
  spec.dependency 'R.swift'
  
  spec.script_phases = [{
    :name => 'R',
    :script => '"$PODS_ROOT/R.swift/rswift" generate --access-level public "$SRCROOT/../Frameworks/UIComponents/Resources/Generated/R.generated.swift"',
    :execution_position => :before_compile,
    :input_files => ["$TEMP_DIR/rswift-lastrun"],
    :output_files => ["$SRCROOT/../Frameworks/UIComponents/Resources/Generated/R.generated.swift"]
  }]
end

