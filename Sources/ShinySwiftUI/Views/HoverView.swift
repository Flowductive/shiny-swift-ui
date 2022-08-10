//
//  SwiftUIView.swift
//  
//
//  Created by Ben Myers on 8/10/22.
//

import SwiftUI

@available(macOS 11.0, *)
public struct HoverView<Content>: View where Content: View {
  
  // MARK: - Public Wrapped Properties
  
  /// The content to display.
  @ViewBuilder public let content: (Bool, Bool) -> Content
  
  /// Whether the view is hovered.
  @State public var hover: Bool = false
  /// Whether the view is clicked.
  @State public var clicked: Bool = false
  
  // MARK: - Public Properties
  
  /// The action to perform on click.
  public let action: () -> Void

  // MARK: - Public Body View
  
  public var body: some View {
    Button(action: action) {
      content(hover, clicked).onHover { hover = $0 }
    }
    .buttonStyle(HoverButtonStyle(pressed: $clicked))
  }
  
  // MARK: - Public Initalizers
  
  public init(action: @escaping () -> Void = {}, content c: @escaping (Bool, Bool) -> Content) {
    self.action = action
    self.content = c
  }
  
  public init(action: @escaping () -> Void = {}, content c: @escaping (Bool) -> Content) {
    self.action = action
    self.content = { (hover: Bool, click: Bool) in
      return c(hover)
    }
  }
}

@available(macOS 11.0, *)
fileprivate struct HoverButtonStyle: ButtonStyle {
  let pressed: Binding<Bool>
  func makeBody(configuration: Configuration) -> some View {
    configuration.label.onChange(of: configuration.isPressed) { val in pressed.wrappedValue = val }
  }
}
