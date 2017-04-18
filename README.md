# TextImageButton

[![Build Status](https://travis-ci.org/timbodeit/TextImageButton.svg?branch=master)](https://travis-ci.org/timbodeit/TextImageButton)
[![Version](https://img.shields.io/cocoapods/v/TextImageButton.svg?style=flat)](http://cocoapods.org/pods/TextImageButton)
[![License](https://img.shields.io/cocoapods/l/TextImageButton.svg?style=flat)](http://cocoapods.org/pods/TextImageButton)
[![Platform](https://img.shields.io/cocoapods/p/TextImageButton.svg?style=flat)](http://cocoapods.org/pods/TextImageButton)

Image spacing and side selection for UIButton. Fully auto-layout compatible.

![Example Gif](./ReadmeImages/example.gif)

## Usage

Setting text and image on TextImageButton works like it does on a vanilla UIButton:

```swift
let button = TextImageButton()

button.setTitle("I'm a TextImageButton", forState: .Normal)
button.setImage(UIImage(named: "beachball"), forState: .Normal)
```

<img src="./ReadmeImages/usage_initial.png" height=40>

---

#### Spacing

It allows specifying the spacing between title and image:

```swift
button.spacing = 20
```

<img src="./ReadmeImages/usage_spacing.png" height=40>

---

#### Image position

To choose the side the image is set on, specify `imagePosition`.  
There is also boolean @IBInspectable `imageOnRight` attribute that you can set inside the storyboard

```swift
button.imagePosition = .Right
```

<img src="./ReadmeImages/usage_right_side.png" height=40>

## Swift Version

While TextImageButton can be used in Objective-C code, it is written completely in Swift.

Version 0.2 is compatible with Swift 3.
For Swift 2 use Version 0.1.1.

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

TextImageButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TextImageButton"
```

## Author

Tim Bodeit, tim@bodeit.com

Inspired by [this](http://stackoverflow.com/a/7113702/1984384) stackoverflow answer by [jasongregori](http://stackoverflow.com/users/184561/jasongregori).

## License

TextImageButton is available under the MIT license. See the LICENSE file for more info.
