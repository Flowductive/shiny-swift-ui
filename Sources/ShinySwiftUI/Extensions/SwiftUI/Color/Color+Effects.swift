//
//  Color.swift
//  
//
//  Created by Ben Myers on 12/5/21.
//

import SwiftUI

@available(macOS 11.0, iOS 13.0, *)
public extension Color {
  
  // MARK: - Public Methods
  
  /**
   Sets the opacity of the color.
   
   - parameter level: The opacity level.
   - returns: The color, with the specified opacity level.
   */
  func opacity(_ level: _OpacityLevel) -> Color {
    return self.opacity(Double(level.rawValue))
  }
}

@available(macOS 11.0, iOS 14.0, *)
public extension Color {
  
  // MARK: - Public Methods
  
  /**
   Makes the color lighter.
   
   - parameter amount: The amount to lighten. Use `0.0` for no lightness and `1.0` for white.
   */
  func lighter(by amount: CGFloat = 0.2) -> Self { Self(_Color(self).lighter(by: amount)) }
  
  /**
   Makes the color darker.
   
   - parameter amount: The amount to darken. Use `0.0` for no darkness and `1.0` for black.
   */
  func darker(by amount: CGFloat = 0.2) -> Self { Self(_Color(self).darker(by: amount)) }
}

#if os(iOS)

fileprivate typealias _Color = UIColor
fileprivate extension UIColor {
  
  func mix(with color: UIColor, amount: CGFloat) -> Self {
    var red1: CGFloat = 0
    var green1: CGFloat = 0
    var blue1: CGFloat = 0
    var alpha1: CGFloat = 0
    
    var red2: CGFloat = 0
    var green2: CGFloat = 0
    var blue2: CGFloat = 0
    var alpha2: CGFloat = 0
    
    getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
    color.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
    
    return Self(
      red: red1 * CGFloat(1.0 - amount) + red2 * amount,
      green: green1 * CGFloat(1.0 - amount) + green2 * amount,
      blue: blue1 * CGFloat(1.0 - amount) + blue2 * amount,
      alpha: alpha1
    )
  }
  
  func lighter(by amount: CGFloat = 0.2) -> Self { mix(with: .white, amount: amount) }
  func darker(by amount: CGFloat = 0.2) -> Self { mix(with: .black, amount: amount) }
}

#elseif os(macOS)

fileprivate typealias _Color = NSColor
fileprivate extension NSColor {
  func mix(with color: NSColor, amount: CGFloat) -> Self {
    var red1: CGFloat = 0
    var green1: CGFloat = 0
    var blue1: CGFloat = 0
    var alpha1: CGFloat = 0
    
    var red2: CGFloat = 0
    var green2: CGFloat = 0
    var blue2: CGFloat = 0
    var alpha2: CGFloat = 0
    
    getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
    color.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
    
    return Self(
      red: red1 * CGFloat(1.0 - amount) + red2 * amount,
      green: green1 * CGFloat(1.0 - amount) + green2 * amount,
      blue: blue1 * CGFloat(1.0 - amount) + blue2 * amount,
      alpha: alpha1
    )
  }
  
  func lighter(by amount: CGFloat = 0.2) -> Self { mix(with: .white, amount: amount) }
  func darker(by amount: CGFloat = 0.2) -> Self { mix(with: .black, amount: amount) }
}

#endif
