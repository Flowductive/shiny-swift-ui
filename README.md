![Social Preview](./Assets/Social%20Preview%20(640).png)

<h2 align="center">SwiftUI extensions and components that just make sense.</h2>

<p align="center">📦 Lightweight, Swift-y looking code for modern SwiftUI developers</p>
<p align="center">⚙️ Dozens of view modifiers to add expected functionality</p>
<p align="center">💨 Custom, built-in transitions & animations for views</p>
<p align="center">💻 Cross-platform Support for iOS, macOS, watchOS</p>
<p align="center">🧩 Pre-made components that look great in any app</p>

***

💕 This package **works great with** and is inspired by [SwiftUIX](https://github.com/SwiftUIX/SwiftUIX)!

🚧 **Wiki under construction.** Read below to get started!

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Flowductive/shiny-swift-ui?label=version)
![GitHub Release Date](https://img.shields.io/github/release-date/Flowductive/shiny-swift-ui?label=latest%20release)
![GitHub issues](https://img.shields.io/github/issues/Flowductive/shiny-swift-ui)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Flowductive/shiny-swift-ui)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FFlowductive%2Feasy-firebase%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Flowductive/shiny-swift-ui)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FFlowductive%2Feasy-firebase%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Flowductive/shiny-swift-ui)

## What is ShinySwiftUI?

ShinySwiftUI aims to turn messy Swift + SwiftUI code into cleaner, Swift-ier code. It also aims to provide a library of useful modifiers, components, and extensions to create consistent, good-looking apps.

```swift
// 😴 Before
HStack {
  ViewA()
  ViewB()
}

// ✨ After
ViewA() + ViewB()
```

```swift
// 😴 Before
MyView().frame(width: 30.0, height: 30.0)

// ✨ After
MyView().frame(30.0)
```

```swift
// 😴 Before
MyView().onAppear {
  UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

// ✨ After
MyView().hideKeyboard()
```

```swift
// 😴 Before
MyView().overlay(RoundedRectangle(cornerRadius: 5.0).stroke(.red, lineWidth: 2.0))

// ✨ After
MyView().roundedBorder(.red, cornerRadius: 5.0, lineWidth: 2.0)
```

## Completed Features

- App Layout
  - Pre-defined spacing values [→](https://github.com/Flowductive/shiny-swift-ui#pre-defined-spacing-values)
  - Layout using Generic Stack [→](https://github.com/Flowductive/shiny-swift-ui#layout-using-generic-stack)
  - Layout using Shove View [→](https://github.com/Flowductive/shiny-swift-ui#layout-using-shove-view)
  - Fixed-width spacers [→](https://github.com/Flowductive/shiny-swift-ui#fixed-width-spacers)
- View Functionality
  - Operations on views [→](https://github.com/Flowductive/shiny-swift-ui#operations-on-views)
  - View frame modifiers [→](https://github.com/Flowductive/shiny-swift-ui#view-frame-modifiers)
  - View refresh modifier [→](https://github.com/Flowductive/shiny-swift-ui#view-refresh-modifier)
  - View styling modifiers [→](https://github.com/Flowductive/shiny-swift-ui#view-styling-modifiers)
  - View timing modifiers [→](https://github.com/Flowductive/shiny-swift-ui#view-timing-modifiers)
  - Custom animation/transitions [→](https://github.com/Flowductive/shiny-swift-ui#custom-animationtransitions)
  - Debugging view modifier [→](https://github.com/Flowductive/shiny-swift-ui#debugging-view-modifier)
  - Screenshot view method [→](https://github.com/Flowductive/shiny-swift-ui#screenshot-view-method)
  - Hover tooltip modifier (macOS) [→](https://github.com/Flowductive/shiny-swift-ui#hover-tooltip-modifier-macos)
  - View mouse position checking (macOS) [→](https://github.com/Flowductive/shiny-swift-ui#view-mouse-position-checking-macos)
- Other Features
  - Image modifiers
  - Color features [→](https://github.com/Flowductive/shiny-swift-ui#color-features)
  - Quick dividers
  - Visual effects [→](https://github.com/Flowductive/shiny-swift-ui#visual-effects)
  - Pre-made buttons
  - Action item highlight modifier

Most of the above features are **cross-platform** and are supported on both iOS and macOS.

## Get Started

Add **ShinySwiftUI** to your project using Swift Package Manager:

```
https://github.com/Flowductive/shiny-swift-ui
```

## 📐 App Layout Features

### Pre-defined spacing values

Improve code consistency with `CGFloat` spacing values:

```swift
MyView().padding(.m).cornerRadius(.xs)
```

These values include: `.xxs`, `.xs`, `.s`, `.m`, `.l`. `.xl`, and `.xxl`.

### Layout using Generic Stack

You can use a generic stack, or `GStack`, to position items vertically or horizontally using a `Bool` input:

```swift
GStack(platform == .iOS ? .vertical : .horizontal) {
  MyViewA()
  MyViewB()
}
```

A typical use case of `GStack` is for changing display layout on macOS vs. iOS devices.

### Layout using Shove View

Use a `ShoveView` to quickly push inner content to one side/corner:

```swift
// Position MyView right
ShoveView(.trailing) {
  MyView()
}

// Position MyView top-left
ShoveView(.topLeading) {
  MyView()
}
```

### Fixed-width spacers

Use fixed-width spacers for consistent spacing:

```swift
// Large vertical spacer
Spacer.VL

// Extra-small vertical spacer
Spacer.HXS
```

Vertical spacer variants include `.VXXS`, `.VXS`, `.VS`, `.VM`, `.VL`, `.VXL`, and `.VXXL`.
Horizontal spacer variants include `.HXXS`, `.HXS`, `.HS`, `.HM`, `.HL`, `.HXL`, and `.HXXL`.

## ⚙️ View Functionality

### Operations on views

You can quickly group views using operators:

```swift
// Horizontal stack
MyViewA() + MyViewB()

// Vertical stack, center-aligned
MyViewA() / MyViewB()

// Vertical stack, left-aligned
MyViewA() /- MyViewB();
```

### View frame modifiers

Easily set the dimensions of a square frame:

```swift
// Sets MyView's frame to width = 30.0, height = 30.0
MyView().frame(30.0)
```

Stretch the view:

```swift
// Stretch horizontally
MyViewA().stretchH()

// Stretch vertically
MyViewB().stretchV()

// Stretch in both directions
MyViewC().stretch()
```

### View refresh modifier

Use a `@State` boolean to refresh a view quickly:

```swift
@State var refresh: Bool = false

var body {
  MyView().refreshable(with: refresh)
}
```

Updating the view would require that `refresh.toggle()` is called.

### View styling modifiers

Set the relative opacity of a view:

```swift
MyView().opacity(.half)
```

You can choose from (in order of opacity) `.opaque`, `.most`, `.half`, `.quarter`, `.almostInvisible`, `.invisible`.

Add a rounded border to any view:

```swift
MyViewA().roundedBorder(.green)
MyViewB().roundedBorder(.red, cornerRadius: .s, lineWidth: 2.0)
```

### View timing modifiers

Repeat an action in a specified interval:

```swift
MyView().every(3.0) {
  print("Hello") // Runs every 3 seconds
}
```

Perform an action after a specified delay:

```swift
MyView().after(3.0) {
  print("Hello") // Runs 3 seconds after the view appears
}
```

### Custom animation/transitions

Add a slick transition to a view using `.slickAnimation(value:)`:

```swift
MyViewA().slickAnimation()
MyViewB().slickAnimation(value: myVal)
```

Add a custom built-in animation; i.e. `.slickEaseOut`, `.slickEaseIn`, `.rampEaseOut`, `.rampEaseIn`, `.bounce`, `.lightBounce`, or `.page`:

```swift
MyViewA().animation(.rampEaseOut)
MyViewB().animation(.slickEaseOut(duration: 1.0), value: myVal)
```

Add a custom built-in transition; i.e. `.turn`, `.swipe`, `.pop`:

```swift
MyViewA().transition(.turn)
```

### Debugging view modifier

Use the `.debug()` view modifier to randomly change the background color of the view for debugging:

```swift
MyView().debug()
```

### Screenshot view method

Take a screenshot of a view and save the image to path:

```swift
myView.snapshot()
```

### Hover tooltip modifier (macOS)

Add a tooltip upon hover to a view:

```swift
MyView()
.withTooltip(present: $showTooltip) {
  Text("This is a tooltip!")
}
```

Add a keyboard shortcut, which automatically adds the shortcut tooltip:

```swift
MyViewA().shortcut("c", modifiers: [.shift, .command])
MyViewB().shortcut(.defaultAction)
```

### View mouse position checking (macOS)

Track the relative position of the mouse pointer within the view:

```swift
MyView().trackingMouse { pos in
  // ...
}
```

## 🎁 Other Features

### Color features

Take advantage of color utilities:

```swift
// Init color from hex code
var color = Color(hex: "#ffffff")

// If bindingBool.wrappedValue is true, show the color
MyView().foregroundColor(.red.if($bindingBool))

// Get a lighter version of a color
lighter = color.ligher(by: 0.3)

// Colors also have relative opacities, just like views
halfColor = color.opacity(.half)
```

When importing ShinySwiftUI, colors will also conform to `Codable`.

### Visual effects

Easily add SwiftUI wraps of `UIVisualEffectView`:

```swift
VisualEffectView()
```
