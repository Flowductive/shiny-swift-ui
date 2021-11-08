//
//  File.swift
//  
//
//  Created by Ben Myers on 11/7/21.
//

import SwiftUI

@available(macOS 10.15, *)
extension Color: _ExpressibleByColorLiteral {
  
  // MARK: - Public Initializers
  
  public init(_colorLiteralRed red: Float, green: Float, blue: Float, alpha: Float) {
    self = Color(red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
  }
}
