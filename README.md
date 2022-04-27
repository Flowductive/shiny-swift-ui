![Social Preview](./Assets/Social%20Preview%20(640).png)

<h2 align="center">SwiftUI extensions and components that just make sense.</h2>

<p align="center">📦 Lightweight, Swift-y looking code for modern SwiftUI developers</p>
<p align="center">⚙️ Dozens of view modifiers to add custom functionality</p>
<p align="center">🧩 Pre-made components that look great in any app</p>
<p align="center">💨 Custom, built-in transitions, animations for views</p>
<p align="center">💻 Cross-platform support on both iOS and macOS</p>








***

⚠️ **Note:** This package is still under development and its contents are freely subject to change.

🚧 **Wiki under construction.** Read below to get started!

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Flowductive/shiny-swift-ui?label=version)
![GitHub Release Date](https://img.shields.io/github/release-date/Flowductive/shiny-swift-ui?label=latest%20release)
![GitHub issues](https://img.shields.io/github/issues/Flowductive/shiny-swift-ui)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Flowductive/shiny-swift-ui)

## What is ShinySwiftUI?

ShinySwiftUI aims to turn messy Swift + SwiftUI code into cleaner, more Swift-y code. It also aims to provide a library of useful modifiers, components, and extensions to create consistent, good-looking apps.

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
  - Use pre-defined spacing values
  - Layout using Generic Stack
  - Layout using Shove Views
  - Add fixed-width spacers
- View Functionality
  - Use operations on views [→]
  - Resize views using modifiers
  - Easily refresh views
  - Add style to views using modifiers
  - Add animations/transitions using modifiers
  - Debug views using modifiers
  - Save a screenshot of a view
  - Add hover tooltips to views (iOS)
  - Check mouse position within a view (macOS)
- Other Features
  - Quickly add dividers
  - Use image modifiers
  - Use color features
  - Add visual effects
  - Add pre-made buttons
  - Highlight tutorial action items

Most of the above features are **cross-platform** and are supported on both iOS and macOS.

## Get Started

Add **ShinySwiftUI** to your project using Swift Package Manager:
