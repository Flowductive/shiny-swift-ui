//
//  SwiftUIView.swift
//  
//
//  Created by Ben Myers on 8/10/22.
//

import SwiftUI

@available(macOS 11.0, iOS 14.0, *)
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
  /// The action to perform on hover.
  public let onHover: (Bool) -> Void

  // MARK: - Public Body View
  
  public var body: some View {
    Button(action: action) {
      content(hover, clicked).onHover {
        hover = $0
        onHover($0)
      }
    }
    .buttonStyle(HoverButtonStyle(pressed: $clicked))
  }
  
  // MARK: - Public Initalizers
  
  public init(action: @escaping () -> Void = {}, onHover: @escaping (Bool) -> Void = { _ in }, content c: @escaping (Bool, Bool) -> Content) {
    self.action = action
    self.onHover = onHover
    self.content = c
  }
  
  public init(action: @escaping () -> Void = {}, onHover: @escaping (Bool) -> Void = { _ in }, content c: @escaping (Bool) -> Content) {
    self.action = action
    self.onHover = onHover
    self.content = { (hover: Bool, click: Bool) in
      return c(hover)
    }
  }
  
  // MARK: - Public Methods
  
  /**
   Animates the `hover` property of the view.
   
   - parameter animation: The Animation to use.
   */
  public func animateHover(_ animation: Animation = .slickEaseOut) -> some View {
    return self.animation(animation, value: hover)
  }
  
  /**
   Animates the `clicked` property of the view.
   
   - parameter animation: The Animation to use.
   */
  public func animateClicked(_ animation: Animation = .slickEaseOut) -> some View {
    return self.animation(animation, value: clicked)
  }
}

@available(macOS 11.0, iOS 14.0, *)
fileprivate struct HoverButtonStyle: ButtonStyle {
  let pressed: Binding<Bool>
  func makeBody(configuration: Configuration) -> some View {
    configuration.label.onChange(of: configuration.isPressed) { val in pressed.wrappedValue = val }
  }
}
