//
//  Color.swift
//  
//
//  Created by Ben Myers on 12/5/21.
//

import SwiftUI

@available(macOS 11.0, iOS 13.0, *)
public extension Color {
  
  /**
   Sets the opacity of the color.
   
   - parameter level: The opacity level.
   - returns: The color, with the specified opacity level.
   */
  func opacity(_ level: _OpacityLevel) -> Color {
    return self.opacity(Double(level.rawValue))
  }
}
