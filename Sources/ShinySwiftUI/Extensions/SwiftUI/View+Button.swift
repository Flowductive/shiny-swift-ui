//
//  Button.swift
//  
//
//  Created by Ben Myers on 11/22/21.
//

import SwiftUI

@available(macOS 11.0, iOS 14.0, *)
public extension View {
  
  // MARK: - Public Methods
  
  /**
   Adds a keyboard shortcut to the button, and displays the shortcut icon above the button when on hover.
   
   - parameter shortcut: The keyboard shortcut.
   - returns: A modified `Button` with a hover effect.
   */
  func shortcut(_ shortcut: KeyboardShortcut) -> some View {
    var str: String = ""
    var symbols: [String] = []
    let modifiers = shortcut.modifiers
    if modifiers.contains(.control) {
      symbols.append("control")
    }
    if modifiers.contains(.option) {
      symbols.append("alt")
    }
    if modifiers.contains(.shift) {
      symbols.append("shift")
    }
    if modifiers.contains(.command) {
      symbols.append("command")
    }
    str += String(shortcut.key.character).capitalized
    if str == " " {
      str = "Space"
    }
    if #available(macOS 12.0, iOS 15.0, *) {
      if shortcut == .defaultAction {
        symbols.append("return")
        str = "Enter"
      }
    }
    return HoverView(button: self.keyboardShortcut(shortcut), string: str, symbols: symbols)
  }
  
  /**
   Adds a keyboard shortcut to the button, and displays the shortcut icon above the button when on hover.
   
   - parameter key: The key equivalent to check for.
   - parameter modifiers: The modifiers affecting the key equivalent.
   - returns: A modified `Button` with a hover effect.
   */
  @ViewBuilder
  func shortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command) -> some View {
    let shortcut = KeyboardShortcut(key, modifiers: modifiers)
    self
      .shortcut(shortcut)
  }
}

@available(macOS 11.0, iOS 13.4, *)
private struct HoverView<T>: View where T: View {
  
  @State var hover: Bool = false
  
  var button: T
  var string: String
  var symbols: [String]
  
  var body: some View {
    ZStack {
      button
        .onHover { over in
          hover = over
        }
      HStack(spacing: .xs) {
        ForEach(symbols, id: \.self) { Image(systemName: $0) }
        Text(string)
      }
      .imageScale(.small)
      .padding(.xs)
      .padding(.horizontal, .xs)
      .background(background)
      .roundedBorder(Color.primary.opacity(0.2), cornerRadius: .s)
      .opacity(hover ? .opaque : .invisible)
      .offset(y: hover ? -35.0 : -25.0)
      .slickAnimation(value: hover)
    }
  }
  
  var background: some View {
    #if os(macOS)
    return VisualEffectView(material: .toolTip)
    #else
    return VisualEffectView()
    #endif
  }
}
