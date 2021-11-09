//
//  View.swift
//  
//
//  Created by Ben Myers on 11/8/21.
//

import SwiftUI

infix operator /-
infix operator /--

@available(macOS 10.15, iOS 13.0, *)
public extension View {
  
  // MARK: - Public Static Methods
  
  static func + <T> (lhs: Self, rhs: T) -> some View where T: View {
    HStack {
      lhs
      rhs
    }
  }
  
  static func / <T> (lhs: Self, rhs: T) -> some View where T: View {
    VStack {
      lhs
      rhs
    }
  }
  
  static func /- <T> (lhs: Self, rhs: T) -> some View where T: View {
    VStack(alignment: .leading) {
      lhs
      rhs
    }
  }
  
  static func /-- <T> (lhs: Self, rhs: T) -> some View where T: View {
    VStack(alignment: .leading, spacing: .s) {
      lhs
      rhs
    }
  }
  
  // MARK: - Public Methods
  
  /**
   Sets the frame to be a square size.
   
   - parameter length: The side length of the frame
   - returns: The view, with a square frame
   */
  @ViewBuilder
  func frame(_ length: CGFloat) -> some View {
    self.frame(width: length, height: length)
  }
  
  /**
   Sets the max witdth to infinity, stretching the view horizontally.
   
   - returns: The view, with a max width of infinity
   */
  @ViewBuilder
  func stretchH() -> some View {
    self.frame(maxWidth: .infinity)
  }
  
  /**
   Sets the max height to infinity, stretching the view vertically.
   
   - returns: The view, with a max height of infinity
   */
  @ViewBuilder
  func stretchV() -> some View {
    self.frame(maxHeight: .infinity)
  }
  
  /**
   Sets the max width and height to infinity, stretching the view both horizontally and vertically.
   
   - returns: The view, with a max width+height of infinity
   */
  @ViewBuilder
  func stretch() -> some View {
    self.stretchV().stretchH()
  }
  
  /**
   Allows the view to be refreshable.
   
   - parameter val: A value that, when updated, refreshes the view
   - returns: The refreshable view
   */
  @ViewBuilder
  func refreshable(with val: Bool) -> some View {
    self.opacity(val ? 1.0 : 1.0)
  }
  
  /**
   Adds a rounded border to the view.
   
   - parameter color: The color of the rounded border
   - parameter cornerRadius: The radius of the border
   - parameter lineWidth: The thickness of the border
   - returns: The view, with a rounded border
   */
  @ViewBuilder
  func roundedBorder(_ color: Color, cornerRadius: CGFloat, lineWidth: CGFloat = 1.0) -> some View {
    self.overlay(
      RoundedRectangle(cornerRadius: cornerRadius)
        .stroke(color, lineWidth: lineWidth)
    )
  }
  
  /**
   Adds a dashed border around the view.
   
   - parameter color: The color of the rounded border
   - parameter cornerRadius: The radius of the border
   - parameter lineWidth: The thickness of the border
   - parameter dashLength: The length of each dash
   - returns: The view, with a dashed border
   */
  @ViewBuilder
  func dashedBorder(_ color: Color, cornerRadius: CGFloat, lineWidth: CGFloat = 1.0, dashLength: CGFloat = 6.5) -> some View {
    self.overlay(
      RoundedRectangle(cornerRadius: cornerRadius)
        .strokeBorder(style: StrokeStyle(lineWidth: lineWidth, dash: [dashLength]))
        .foregroundColor(color)
    )
  }
  
  /**
   Gives the view a slick-looking animation. Disables animation if `Local.shared.reducedMotion` is `true`.
   
   - returns: An animated view
   */
  @ViewBuilder
  func slickAnimation() -> some View {
    self.animation(.slickEaseOut)
  }
  
  /**
   Gives the view a slick-looking animation. Disables animation if `Local.shared.reducedMotion` is `true`.
   
   - parameter value: The optional value to compare for animation
   - returns: An animated view
   */
  @ViewBuilder
  func slickAnimation<T>(value: T) -> some View where T: Equatable {
    self.animation(.slickEaseOut, value: value)
  }
  
  /**
   A conditional view modifier.
   
   - parameter condition: The condition that must be true in order to apply a modifier
   - parameter transform: A closure that passes a view and applies view modifiers to it
   */
  @ViewBuilder
  func `if`<Transform: View>(
    _ condition: Bool,
    transform: (Self) -> Transform
  ) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}

#if os(iOS)
import UIKit

@available(iOS 13.0, *)
public extension View {
  
  // MARK: - Public Methods
  
  /**
   Hides the keyboard, if shown.
   */
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
  
  /**
   Renders the view as a `UIImage`.
   
   - returns: A rendered view as a `UIImage`
   */
  func snapshot() -> UIImage {
    let controller = UIHostingController(rootView: self)
    let view = controller.view
    
    let targetSize = controller.view.intrinsicContentSize
    view?.bounds = CGRect(origin: .zero, size: targetSize)
    view?.backgroundColor = .clear
    
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    
    return renderer.image { _ in
      view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
    }
  }
}
#endif
