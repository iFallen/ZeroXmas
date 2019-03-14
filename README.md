# ZeroXmas

[![CI Status](https://img.shields.io/travis/iFallen/ZeroXmas.svg?style=flat)](https://travis-ci.org/iFallen/ZeroXmas)
[![Version](https://img.shields.io/cocoapods/v/ZeroXmas.svg?style=flat)](https://cocoapods.org/pods/ZeroXmas)
[![License](https://img.shields.io/cocoapods/l/ZeroXmas.svg?style=flat)](https://cocoapods.org/pods/ZeroXmas)
[![Platform](https://img.shields.io/cocoapods/p/ZeroXmas.svg?style=flat)](https://cocoapods.org/pods/ZeroXmas)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ZeroXmas is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
swift >= 4.2
pod 'ZeroXmas'
```

## IMG

- `Demo`

|IMG1|IMG2|IMG3|
|----|----|----|
|![1](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/1.png)|![2](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/2.png)|![3](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/3.png)|

- `Config`

|CONFIG|
|----|
|![config](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/4.png)|


## Usage

>
import ZeroXmas

### `Tint Color`

```Swift
UIColor.zx.tint
UIColor.zx.subTint
UIColor.zx.background
UIColor.zx.border
UIColor.zx.empty
UIColor.zx.customA
UIColor.zx.customB
UIColor.zx.customC
```

- `Config`

|ZXTintColorConfig.plist|
|----|
|![c](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/colorConfig.png)|

### `Font`

- `Color`

```Swift
UIColor.zx.title
UIColor.zx.body
UIColor.zx.mark
```

- `Font`


```Swift
UIFont.zx.titleFont()
UIFont.zx.markFont()
UIFont.zx.bodyFont()

//more:
UIFont.zx.bodyFont(18)
UIFont.zx.bodyFont(fix: -1)//size = ZXFontConfig.bodyFontSize - 1
UIFont.zx.bodyFont(fix: 1) //size = ZXFontConfig.bodyFontSize + 1

//iconFont
UIFont.zx.iconFont()

```

- `Config`

|ZXFontConfig.plist|
|----|
|![c](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/fontConfig.png)|



### `NavBar`


- `Load`

```Swift
ZXConfig.loadNavBarConfig()
```

- `Color`

```Swift
UIColor.zx.navBar.xxx
```

- `Extension fo vc`

```Swift

self.zx.addNavBarButtonItems(textNames: ["关闭"], font: nil, color: UIColor.yellow, at: .left)

self.zx.addNavBarButtonItems(textNames: ["\u{e673}"], font: UIFont.zx.iconFont(30), color: UIColor.zx.subTint, at: .right, fixSpace: 5)
```

|TEST|
|----|
|![t](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/nav1.png)|

- `Config`

|ZXNavBarConfig.plist|
|----|
|![c](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/navConfig.png)|


### `TabBar`

- `Load`

```Swift
ZXConfig.loadTabBarConfig()
```

- `Usage`

```Swift
tabBar = UITabBarController()
tabBar.zx.addChild(T1ViewController(), fromPlistItemIndex: 0, imageAsTemplate: true)
tabBar.zx.addChild(T2ViewController(), fromPlistItemIndex: 1)
tabBar.zx.addChild(T3ViewController(), fromPlistItemIndex: 2)//showAsPresent
tabBar.zx.addChild(T4ViewController(), fromPlistItemIndex: 3, imageAsTemplate: true)
tabBar.zx.addChild(T5ViewController(), fromPlistItemIndex: 4, imageAsTemplate: true)
...
```

- `Config`

|ZXTabBarConfig.plist|
|----|
|![c](https://github.com/iFallen/ZeroXmas/raw/master/ScreenShots/tabConfig.png)|

### `Tiny Network`

```Swift
ZXNetwork.async(...)
ZXNetwork.uploadImage(...)
ZXNetwork.fileupload(...)
```

### `Common Extension`

```Swift
Bundle
NSAttributedString
ReusableView
String
Timer
UIAlertController
...
```

## Use ZX

```Swift
extension ZeroXmas where Base: XXX {
	static func sFunc() {}
	func Func() {}
}

XXX.zx.sFunc()
XXX().zx.Func()
```

## Author

iFallen, hulj1204@yahoo.com

## License

ZeroXmas is available under the MIT license. See the LICENSE file for more info.
