Pod::Spec.new do |s|
  s.name             = "TextImageButton"
  s.version          = "0.1.0"
  s.summary          = "Image spacing and side selection for UIButton"

  s.description      = <<-DESC
    TextImageButton allows specifying spacing between image and title as well as the side
    to display the image on.
                       DESC

  s.homepage         = "https://github.com/timbodeit/TextImageButton"
  s.license          = 'MIT'
  s.author           = { "Tim Bodeit" => "tim@bodeit.com" }
  s.source           = { :git => "https://github.com/timbodeit/TextImageButton.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TextImageButton' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end
