//
//  Text.swift
//  
//
//  Created by Ben Myers on 3/16/22.
//

import SwiftUI

@available(macOS 10.15, iOS 13.0, *)
public extension Text {
  
  // MARK: - Public Methods
  
  /**
   Adds a transition to the text.
   
   - parameter t: The transition to use.
   - parameter value: The value to animate.
   */
  func transition(_ t: AnyTransition, value: String) -> some View {
    TextTransitionIDGenerator.count += 1
    return self.transition(t).id("_t\(TextTransitionIDGenerator.count)\(value)")
  }
}

fileprivate struct TextTransitionIDGenerator {
  static var count: Int = 0
}
