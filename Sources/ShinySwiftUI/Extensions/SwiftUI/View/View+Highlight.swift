//
//  View+Highlight.swift
//  
//
//  Created by Ben Myers on 3/16/22.
//

import SwiftUI

@available(macOS 11.0, iOS 13.4, *)
public extension View {
  
  // MARK: - Public Methods
  
  /**
   Highlights the view if the provided `Binding` value matches.
   
   - parameter index: The index of the highlighted view.
   - parameter value: The `Binding` value to check. If it matches `index`, the highlight will display.
   */
  @ViewBuilder
  func highlight(_ index: Int, monitoring value: Binding<Int?>) -> some View {
    self
      .overlay(
        RoundedRectangle(cornerRadius: .xs)
          .stroke(.yellow.if(value == index), lineWidth: 2.0)
      )
      .slickAnimation(value: value.wrappedValue)
  }
}

fileprivate func == <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Equatable {
  Binding(
    get: {
      lhs.wrappedValue == rhs
    },
    set: {
      if $0 {
        lhs.wrappedValue = rhs
      }
    }
  )
}
