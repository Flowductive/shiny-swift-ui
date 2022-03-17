//
//  Color.swift
//  
//
//  Created by Ben Myers on 3/16/22.
//

import SwiftUI

@available(macOS 11.0, iOS 13.0, *)
public extension Color {
  
  // MARK: - Public Methods
  
  /**
   Returns the color if the given condition is true, returns `.clear` otherwise.
   
   - parameter condition: The condition to show the color.
   */
  func `if`(_ condition: Binding<Bool>) -> Color {
    return condition.wrappedValue ? self : .clear
  }
}
